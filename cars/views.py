from django.http import HttpResponse
from django.shortcuts import render
from cars.forms import ManuForm
from django.db import connection


from .models import Manufacturers


def index(request):
    return HttpResponse("Hello, world. You're at the cars index.")

def manu(request):
    manufacturers = Manufacturers.objects.all()
    return render(request, "Manufacturers.html", {'manus': manufacturers})

def add_Manu(request):
    cursor = connection.cursor()
    name = request.POST["name"]
    country = request.POST["country"]
    year = name = request.POST["year_founded"]
    revenue = request.POST["revenue"]
    cursor.execute("""INSERT INTO cars_Manufacturers (name, country, year_founded,revenue) VALUES (%s,%s,%s,%s)""",(name, country, year, revenue))
    return render(request, "add_manufactuers.html")


def home(request):
    return render(request, "home.html", {})



