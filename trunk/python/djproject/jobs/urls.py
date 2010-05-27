from django.conf.urls.defaults import *

urlpatterns = patterns('djproject.jobs.views',
		(r'^$', 'index'),
		(r'^(?P<object_id>\d+)/$', 'detail'),
)
