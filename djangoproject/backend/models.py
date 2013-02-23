from django.db import models
from django.contrib.auth.models import User

class Region(models.Model):
	name = models.CharField(max_length=100)

class Lake(models.Model):
    region = models.ForeignKey(Region)
    name = models.CharField(max_length=100)
    latitude = models.CharField(max_length=255)
    longitude = models.CharField(max_length=255)

class LakePh(models.Model):
	lake = models.ForeignKey(Lake)
	user = models.ForeignKey(User)
	date = models.DateField()
	value = models.FloatField()

class LakeOxygen(models.Model):
	lake = models.ForeignKey(Lake)
	user = models.ForeignKey(User)
	date = models.DateField()
	value = models.FloatField()

class LakePicture(models.Model):
	lake = models.ForeignKey(Lake)
	user = models.ForeignKey(User)
	date = models.DateField()
	path = models.CharField(max_length=100)

class LakeNews(models.Model):
	lake = models.ForeignKey(Lake)
	content = models.TextField()