from django.http import HttpResponse
from django.shortcuts import render, redirect
from django.views.generic import ListView

from cars.forms import ManuForm
from cars.forms import AucForm

from django.db import connection
from django.db.models import Q





from .models import Manufacturers
from .models import Auction


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


def auc(request):
    if (request.method == 'GET'):

        query = request.GET.get('q')
        query2 = request.GET.get('d')
        if not query and not query2:
            auction = Auction.objects.all()
            return render(request, "Auction.html", {'aucs': auction})
        if query and not query2:
            auction = Auction.objects.filter(Q(capacity__icontains=query) | Q(city__icontains=query) |
                                                         Q(state__icontains=query))
            return render(request, "Auction.html", {'aucs': auction})
        if query2 and not query:
            Auction.objects.filter(Q(id=query2)).delete()
            auction = Auction.objects.all()
            return render(request, "Auction.html", {'aucs': auction})

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


def stored_procedure():
    count = Auction.objects.all().count()
    if (count == 10):
        # Auction.objects.order_by('auc_date')[0].delete()
        Auction.objects.earliest('auc_date').delete()


def add_Auc(request):
    if request.method == 'POST':
        stored_procedure()
        cursor = connection.cursor()
        capacity = request.POST["capacity"]
        city = request.POST["city"]
        state = request.POST["state"]
        auc_date = request.POST["auc_date"]
        start_time = request.POST["start_time"]
        end_time = request.POST["end_time"]
        no_of_cars = request.POST["no_of_cars"]
        cursor.execute("""INSERT INTO cars_auction (capacity, city, state, auc_date, start_time, end_time, no_of_cars)
                        VALUES (%s,%s,%s,%s,%s,%s,%s)""",
                       (capacity, city, state, auc_date, start_time, end_time, no_of_cars))
        return render(request, "home.html")
    else:
        # GET request, present an empty form
        form = AucForm()
        return render(request, 'add_auction.html', {"form": form})

def home(request):
    context ={}
    context['form'] = add_Auc(request)
    return render(request, "home.html", context)
    #return render(request, "home.html", {})






