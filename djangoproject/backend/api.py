from django.contrib.auth.models import User
from django.conf.urls.defaults import *
from tastypie import fields
from tastypie.authorization import Authorization
from tastypie.resources import ModelResource
from tastypie.utils import trailing_slash

from tastypie.serializers import Serializer
from django.utils import simplejson

from decimal import Decimal

from djangoproject.backend.models import *
from djangoproject.backend.api_helpers import *

''' Workaround class to be compatible with backbone.js
'''
class BackboneModelResource(ModelResource):

    class Meta:
        always_return_data = True

    def alter_list_data_to_serialize(self, request, data):
        return data["objects"]
		
'''
Any resource to be added to the api must also be registered to the api_v1 variable in the urls.py file.
All resouces use an Authorization instance to authorize actions, which is great for testing but very insecure... This should definitely be fixed in production code.
'''

class NewsResource(BackboneModelResource):
    class Meta:
        queryset = LakeNews.objects.all()
        resource_name = 'news'
        authorization = Authorization()

    def override_urls(self):
        return [
            url(r"^(?P<resource_name>%s)/latest%s$" % (self._meta.resource_name, trailing_slash()), self.wrap_view('get_latest_news'), name="api_get_latest_news"),
        ]

    def get_latest_news(self, request, **kwargs):
        self.method_check(request, allowed=['get'])
        self.throttle_check(request)

        itemCount = request.GET.get('count', '-1')
        if (itemCount < 0):
            itemCount = 5
        news = LakeNews.objects.all()[:itemCount]
        news = bundleItemCollection(self, request, news)
        return self.create_response(request, news)


class RegionResource(BackboneModelResource):
    class Meta:
        queryset = Region.objects.all()
        resource_name = 'region'
        authorization = Authorization()

class LakeResource(BackboneModelResource):
    region = fields.ForeignKey(RegionResource, 'region', full=True)
    class Meta:
        queryset = Lake.objects.all()
        resource_name = 'lake'
        authorization= Authorization() # Great for testing in development but VERY INSECURE =D

    def override_urls(self):
        return [
            url(r"^(?P<resource_name>%s)/byUser%s$" % (self._meta.resource_name, trailing_slash()), self.wrap_view('get_by_userid'), name="api_get_by_userid"),
        ]

    def get_by_userid(self, request, **kwargs):
        self.method_check(request, allowed=['get'])
        #self.is_authenticated(request)
        self.throttle_check(request)

        # Find the user
        userId =request.GET.get('u', '')
        user = User.objects.get(id=userId)
        userProfile = UserProfile.objects.get(user=user)

        lakes = bundleItemCollection(self, request, userProfile.pinnedLakes.all())
        return self.create_response(request, lakes)
    
class UserResource(BackboneModelResource):
    class Meta:
        queryset = Region.objects.all()
        resource_name = 'user'
        authorization = Authorization()
        
class LakePhResource(BackboneModelResource):
    lake = fields.ForeignKey(LakeResource, 'lake', full=True)
    user = fields.ForeignKey(UserResource, 'user', full=True)
    class Meta:
        default_format = "application/json"
        always_return_data = True;
        # serializer = Serializer()
        queryset = LakePh.objects.all()
        resource_name = 'lakePh'
        authorization= Authorization() # Great for testing in development but VERY INSECURE =D

    def override_urls(self):
        return [
            url(r"^(?P<resource_name>%s)%s$" % (self._meta.resource_name, trailing_slash()), self.wrap_view('setPh'), name="api_setPh")
        ]

    def setPh(self, request, **kwargs):
        self.method_check(request, allowed=['post'])
        #self.is_authenticated(request)
        self.throttle_check(request)
        
        json_data = simplejson.loads(request.raw_post_data)        
        # Parse json
        phInput = float(json_data['value'])
        userId = json_data['userId']
        lakeId = json_data['lakeId']
        
        # Fetch user & lake objects
        lakeObject = Lake.objects.get(id=lakeId)
        userObject = User.objects.get(id=userId)
        try:
            userName = userObject.name
        except AttributeError:
            userName = "A user"
        
        # Create the lake
        LakePh.create(lakeObject, userObject, phInput)
        
        #Create news item
        LakeNews.create(lakeObject, userObject, '%s measured PH level of %s' % (userName, lakeObject.name))
        
        print phInput
        result = "very_clean" # Result of measurement is defaulted to 'very_clean'
        desiredPh = Decimal(7.0)
        phChangeInterval = Decimal(0.2)
        print abs(Decimal(phInput) - desiredPh)
        print phChangeInterval
        phDifference = abs(Decimal(phInput) - desiredPh) / phChangeInterval
        print phDifference
        # print phDifference >= 1.0
        # print abs(phDifference - 1.0)
        
        if phDifference.compare(Decimal(3.0)) == 1:
            result = "very_dirty"
        elif phDifference.compare(Decimal(2.0)) == 1:
            result = "dirty"
        elif phDifference.compare(Decimal(1.0)) == 1:
            result = "clean"
        
        return self.create_response(request, "{\"result\":\"" + result + "\"}")