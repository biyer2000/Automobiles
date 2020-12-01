

# Create your views here.
from django.http import HttpResponse
from django.shortcuts import render
from cars.forms import ManuForm


from .models import Manufacturers


def index(request):
    return HttpResponse("Hello, world. You're at the cars index.")

def manu(request):
    manufacturers = Manufacturers.objects.all()
    return render(request, "Manufacturers.html", {'manus': manufacturers})

def home(request):
    return render(request, "home.html", {})



