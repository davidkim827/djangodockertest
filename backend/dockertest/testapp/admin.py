from django.contrib import admin
from .models import Coffee, Cafe

# Register your models here.
@admin.register(Cafe, Coffee)
class CoffeeAdmin(admin.ModelAdmin):
    pass