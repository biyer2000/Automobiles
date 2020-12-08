from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name='default'),
    path('manu/', views.manu, name='manu'),
    path('auc/', views.auc, name='auc'),
    path('vec/', views.vec, name='vec'),
    path('home/', views.home, name='home'),
    path('add_Manu/', views.add_Manu, name='add_Manu'),
    path('add_Auc/', views.add_Auc, name='add_Auc'),
    path('add_vec/', views.add_vec,name='add_vec'),


]