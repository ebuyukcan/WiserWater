from django.conf import settings
from django.conf.urls.defaults import *
from django.conf.urls import *
from tastypie.api import Api
from djangoproject.backend.api import *

# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

# REST resources
v1_api = Api(api_name='v1')
v1_api.register(LakeResource())
v1_api.register(RegionResource())
v1_api.register(NewsResource())
v1_api.register(LakePhResource())
v1_api.register(UserResource())

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'djangoproject.views.home', name='home'),
    # url(r'^djangoproject/', include('djangoproject.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    url(r'^admin/', include(admin.site.urls)),

    url(r'^$', 'djangoproject.backend.views.index'),
    url(r'^api/', include(v1_api.urls)),
)

if settings.DEBUG:
    urlpatterns += patterns('',
        (r'^media/(?P<path>.*)$', 'django.views.static.serve', {'document_root': settings.MEDIA_ROOT, 'show_indexes':True}),
)