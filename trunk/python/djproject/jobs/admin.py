#!/usr/bin/python
#coding=UTF-8

from django.contrib import admin
from jobs import models

class LocationAdmin(admin.ModelAdmin):
	list_display = ("city", "state", "country")

class JobAdmin(admin.ModelAdmin):
	list_display = ("job_title", "location", "pub_date")
	ordering = ["-pub_date"]
	search_fields = ("job_title", "job_description")
	list_filter = ("location",)

admin.site.register(models.Location, LocationAdmin)
admin.site.register(models.Job, JobAdmin)
