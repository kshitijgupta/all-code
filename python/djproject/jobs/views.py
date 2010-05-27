#!/usr/bin/python
#coding=UTF-8

from django.shortcuts import get_object_or_404, render_to_response
from jobs.models import Job

def index(request):
	object_list = Job.objects.order_by('-pub_date')[:10]
	return render_to_response('jobs/job_list.html', {'object_list':object_list})

def detail(request, object_id):
	job = get_object_or_404(Job, pk=object_id)
	return render_to_response('jobs/job_detail.html', {'object':job})
