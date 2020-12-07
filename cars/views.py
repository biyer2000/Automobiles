from django.http import HttpResponse
from django.shortcuts import render, redirect
from cars.forms import ManuForm
from django.db import connection





from .models import Manufacturers


def index(request):
    return HttpResponse("Hello, world. You're at the cars index.")

def manu(request):
    manufacturers = Manufacturers.objects.all()
    return render(request, "Manufacturers.html", {'manus': manufacturers})

def add_Manu(request):
    #cursor = connection.cursor()
    #name = request.POST["name"]
    #country = request.POST["country"]
    #year = request.POST["year_founded"]
    #revenue = request.POST["revenue"]
    #cursor.execute("""INSERT INTO db.sqlite3.Manufacturers (name, country, year_founded,revenue) VALUES (%s,%s,%s,%s)""",(name, country, year, revenue))
    #return render(request, "add_manufactuers.html")
    if request.method == 'POST':
        form = ManuForm(request.POST)
        if form.is_valid():
            form.save()
            # read the doc for `redirect` and change the destination to
            # something that makes sense for your app.
            # as to why we redirect, cf  https://en.wikipedia.org/wiki/Post/Redirect/Get
            return redirect("/")

    else:
        # GET request, present an empty form
        form = ManuForm()
    return render(request, 'add_manufacturers.html', {"form": form})
    䴀

def home(request):
    context ={}
    context['form']= add_Manu(request)
    return render(request, "home.html", context)
    #return render(request, "home.html", {})



