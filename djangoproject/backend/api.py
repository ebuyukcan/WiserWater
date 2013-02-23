from django.contrib.auth.models import User

from tastypie import fields
from tastypie.authorization import Authorization
from tastypie.resources import ModelResource
from tastypie.utils import trailing_slash

from djangoproject.backend.models import Lake

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

class LakeResource(ModelResource):
    class Meta:
        queryset = Lake.objects.all()
        resource_name = 'lake'
        authorization= Authorization() # Great for testing in development but VERY INSECURE =D