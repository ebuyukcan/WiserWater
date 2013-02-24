from django.db import models
from django.contrib.auth.models import User
import datetime

class Region(models.Model):
    name = models.CharField(max_length=100)

    def __unicode__(self):
        return self.name


class Lake(models.Model):
    region = models.ForeignKey(Region)
    name = models.CharField(max_length=100)
    latitude = models.CharField(max_length=255)
    longitude = models.CharField(max_length=255)

    def __unicode__(self):
        return self.name


class LakePh(models.Model):
	lake = models.ForeignKey(Lake)
	user = models.ForeignKey(User)
	date = models.DateField(default=datetime.datetime.now)
	value = models.FloatField()

class LakeOxygen(models.Model):
	lake = models.ForeignKey(Lake)
	user = models.ForeignKey(User)
	date = models.DateField(default=datetime.datetime.now)
	value = models.FloatField()

class LakePicture(models.Model):
	lake = models.ForeignKey(Lake)
	user = models.ForeignKey(User)
	date = models.DateField(default=datetime.datetime.now)
	path = models.FileField(upload_to='lakes')

class LakeNews(models.Model):
	lake = models.ForeignKey(Lake)
	content = models.TextField()

class UserProfile(models.Model):  
    user = models.OneToOneField(User)
    region = models.ForeignKey(Region)
    pinnedLakes = models.ManyToManyField(Lake)
    
    avatar = models.FileField(upload_to='profiles')

    def __str__(self):  
          return "%s's profile" % self.user