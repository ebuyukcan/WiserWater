from django.contrib.auth.models import User
from django.conf.urls.defaults import *
from tastypie import fields
from tastypie.authorization import Authorization
from tastypie.resources import ModelResource
from tastypie.utils import trailing_slash

from djangoproject.backend.models import *

# authorization= Authorization() # Great for testing in development but VERY INSECURE =D

'''
class UserResource(ModelResource):
    class Meta:
        queryset = User.objects.all()
        resource_name = 'user'

class UserLakeResource(ModelResource):
	user = fields.ForeignKey(UserResource, 'user') 
	lakes = fields.ToManyField('LakeResource', 'lake', full=True)
	class Meta:
			queryset = 
			resource_name = 'userLakes'
'''

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
        
        lake_list = []
        print userProfile.pinnedLakes.all()
        for lake in userProfile.pinnedLakes.all():
            bundle = self.build_bundle(obj=lake, request=request)
            bundle = self.full_dehydrate(bundle)
            lake_list.append(bundle)

        object_list = {
            'objects': lake_list,
        }

        return self.create_response(request, object_list)