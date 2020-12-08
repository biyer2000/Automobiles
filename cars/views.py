from django.http import HttpResponse
from django.shortcuts import render, redirect
from django.views.generic import ListView

from cars.forms import ManuForm
from django.db import connection
from django.db.models import Q





from .models import Manufacturers


def index(request):
    return HttpResponse("Hello, world. You're at the cars index.")

def manu(request):
    if(request.method == 'GET'):
        query = request.GET.get('q')
        query2 = request.GET.get('d')
        if not query and not query2 :
            manufacturers = Manufacturers.objects.all()
            return render(request, "Manufacturers.html", {'manus': manufacturers})
        if query and not query2:
            manufacturers = Manufacturers.objects.filter(Q(name__icontains=query)| Q(country__icontains=query)|
                                                     Q(year_founded__icontains=query)|Q(revenue__icontains=query))
            return render(request, "Manufacturers.html", {'manus': manufacturers})
        if query2 and not query :
            Manufacturers.objects.filter(Q(id=query2)).delete()
            manufacturers = Manufacturers.objects.all()
            return render(request, "Manufacturers.html", {'manus': manufacturers})


def add_Manu(request):
    if request.method == 'POST':
        cursor = connection.cursor()
        name = request.POST["name"]
        country = request.POST["country"]
        year = request.POST["year_founded"]
        revenue = request.POST["revenue"]
        cursor.execute("""INSERT INTO cars_manufacturers (name, country, year_founded,revenue) VALUES (%s,%s,%s,%s)""",
                       (name, country, year, revenue))
        return render(request, "home.html")
    else:
        # GET request, present an empty form
        form = ManuForm()
    return render(request, 'add_manufacturers.html', {"form": form})


def home(request):
    context ={}
    context['form']= add_Manu(request)
    return render(request, "home.html", context)
    #return render(request, "home.html", {})






