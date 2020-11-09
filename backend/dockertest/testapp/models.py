from django.db import models

# Create your models here.
class Cafe(models.Model):
    name = models.CharField(max_length=50, blank=True, null=True)
    is_popular = models.BooleanField(blank=True, null=True)

    def __str__(self):
        return self.name

class Coffee(models.Model):
    REGION_CHOICES = ((1, "South America"), (2, "Middle East"), (3, "Africa"))
    flavor = models.CharField(max_length=50, null=True, blank=True)
    region = models.IntegerField(choices=REGION_CHOICES, null=True, blank=True)
    hot = models.BooleanField(null=True, blank=True)
    description = models.CharField(max_length=255, blank=True, null=True)
    store = models.ForeignKey("Cafe", on_delete=models.CASCADE, related_name="coffees")

    def __str__(self):
        return self.flavor