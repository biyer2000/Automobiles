from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name='default'),
    path('manu/', views.manu, name='manu'),
    path('home/', views.home, name='home'),


]