from . import views
from django.urls import path

urlpatterns = [
    path('newapp/', views.index),
]