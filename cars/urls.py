from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name='default'),
    path('manu/', views.manu, name='manu'),
    path('home/', views.home, name='home'),
    path('add_Manu/', views.add_Manu, name='add_Manu'),

]