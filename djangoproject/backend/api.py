from django.contrib.auth.models import User
from django.conf.urls.defaults import *
from tastypie import fields
from tastypie.authorization import Authorization
from tastypie.resources import ModelResource
from tastypie.utils import trailing_slash

from djangoproject.backend.models import *
from djangoproject.backend.api_helpers import *

# authorization= Authorization() # Great for testing in development but VERY INSECURE =D

class NewsResource(ModelResource):
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


class RegionResource(ModelResource):
    class Meta:
        queryset = Region.objects.all()
        resource_name = 'region'
        authorization = Authorization()

class LakeResource(ModelResource):
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