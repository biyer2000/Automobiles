from django.http import HttpResponse
from django.shortcuts import render


from cars.forms import ManuForm, AucForm, VecForm, CarForm, PerForm ,AucPerForm

from django.db import connection
from django.db.models import Q

from .models import Manufacturers, Auction, Vehicle, Cars, Person, Auction_Person


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
        if query2 and not query:
            Manufacturers.objects.filter(Q(id__icontains=query2)).delete()
            manufacturers = Manufacturers.objects.all()
            return render(request, "Manufacturers.html", {'manus': manufacturers})


def auc(request):
    if (request.method == 'GET'):
        stored_procedure()
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
            Auction.objects.filter(Q(id__icontains=query2)).delete()
            auction = Auction.objects.all()
            return render(request, "Auction.html", {'aucs': auction})


def vec(request):
    if (request.method == 'GET'):
        query = request.GET.get('q')
        query2 = request.GET.get('d')

        if not query and not query2:
            vehicles = Vehicle.objects.all()
            return render(request, "Vehicle.html", {'vecs': vehicles})
        if query and not query2:
            vehicles = Vehicle.objects.filter(Q(manufacturer__name__icontains=query)|
                                              Q(model_name__icontains=query)|
                                              Q(no_of_doors__icontains=query)|
                                              Q(mpg__icontains=query)|
                                              Q(car_availabilty__icontains=query)|
                                              Q(seating_capacity__icontains=query)|
                                              Q(vehicle_type__icontains=query))
            return render(request, "Vehicle.html", {'vecs': vehicles})
        if query2 and not query:
            Vehicle.objects.filter(Q(id__icontains=query2)).delete()
            vehicles = Auction.objects.all()
            return render(request, "Vehicle.html", {'vecs': vehicles})


def car(request):
    if (request.method == 'GET'):
        query = request.GET.get('q')
        query2 = request.GET.get('d')

        if not query and not query2:
            cars = Cars.objects.all()
            return render(request, "Car.html", {'cars': cars})
        if query and not query2:
            cars = Cars.objects.filter(Q(manufacturer__name__icontains=query)|
                                              Q(vin__icontains=query)|
                                              Q(plate_no__icontains=query)|
                                              Q(no_of_accidents__icontains=query)|
                                              Q(year__icontains=query)|
                                              Q(model__icontains=query)|
                                              Q(color__icontains=query)|
                                              Q(base_price__icontains=query)|
                                              Q(owner__icontains=query))
            return render(request, "Car.html", {'cars': cars})
        if query2 and not query:
            Cars.objects.filter(Q(id__icontains=query2)).delete()
            cars = Cars.objects.all()
            return render(request, "Car.html", {'cars': cars})

def per(request):
    if(request.method == 'GET'):
        query = request.GET.get('q')
        query2 = request.GET.get('d')
        if not query and not query2:
            people = Person.objects.all()
            return render(request, "Person.html", {'people': people})
        if query and not query2:
            people = Person.objects.filter(Q(name__icontains=query)|Q(dob__icontains=query)|Q(vehicle_preference__icontains=query))
            return render(request, "Person.html", {'people': people})
        if query2 and not query:
            Person.objects.filter(Q(id__icontains=query2)).delete()
            people = Person.objects.all()
            return render(request, "Person.html", {'people': people})

def aucper(request):
    if (request.method == 'GET'):
        query = request.GET.get('q')
        query2 = request.GET.get('d')
        if not query and not query2:
            aucpeople = Auction_Person.objects.all()
            return render(request, "AucPerson.html", {'aucper': aucpeople})
        if query and not query2:
            aucpeople = Auction_Person.objects.filter(
                Q(auct__id__icontains=query) | Q(pers__id_icontains=query) | Q(id__icontains=query))
            return render(request, "AucPerson.html", {'aucper': aucpeople})
        if query2 and not query:
            Auction_Person.objects.filter(Q(id__icontains=query2)).delete()
            aucpeople = Auction_Person.objects.all()
            return render(request, "AucPerson.html", {'aucper': aucpeople})






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
    if count > 10:
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
        return render(request, "Auction.html")
    else:
        # GET request, present an empty form
        form = AucForm()
        return render(request, 'add_auction.html', {"form": form})


def add_vec(request):
    if request.method == 'POST':
        cursor = connection.cursor()
        manufacturer = request.POST["manufacturer"]
        model = request.POST["model_name"]
        doors = request.POST["no_of_doors"]
        mpg = request.POST["mpg"]
        car_avail = request.POST.get('car_availability', False)
        seating_cap = request.POST["seating_capacity"]
        vec_type = request.POST["vehicle_type"]
        cursor.execute("""INSERT INTO cars_vehicle (manufacturer, model_name, no_of_doors, mpg, car_availability, seating_capacity, vehicle_type)
                        VALUES (%s,%s,%s,%s,%s,%s,%s)""",
                       (manufacturer, model, doors, mpg, car_avail, seating_cap, vec_type))
        return render(request, "Vehicle.html")
    else:
        # GET request, present an empty form
        form = VecForm()
        return render(request, 'add_vehicle.html', {"form": form})

def add_car(request):
        if request.method == 'POST':
            cursor = connection.cursor()
            manufacturer = request.POST['manufacturer']
            vin = request.POST['vin']
            plate_no = request.POST['plate_no']
            no_of_accidents = request.POST['no_of_accidents']
            year = request.POST['year']
            model = request.POST['model']
            color = request.POST['color']
            base_price = request.POST['base_price']
            owner = request.POST['owner']
            cursor.execute("""INSERT INTO cars_cars (manufacturer,vin, plate_no, no_of_accidents, year, model, color, base_price, owner)
                            VALUES (%s,%s,%s,%s,%s,%s,%s, %s)""",
                           (manufacturer, vin, plate_no, no_of_accidents, year, model,color, base_price, owner))
            return render(request, "Car.html")
        else:
            # GET request, present an empty form
            form = CarForm()
            return render(request, 'add_car.html', {"form": form})


def add_per(request):
    if request.method == 'POST':
        cursor = connection.cursor()
        name = request.POST['name']
        dob = request.POST['dob']
        pref = request.POST['vehicle_preference']
        cursor.execute("""INSERT INTO cars_person (name,dob,vehicle_preference)
                        VALUES (%s,%s,%s)""",
                       (name, dob, pref))
        return render(request, "Person.html")
    else:
        # GET request, present an empty form
        form = PerForm()
        return render(request, 'add_person.html', {"form": form})

def add_auc_per(request):
    if request.method == 'POST':
        cursor = connection.cursor()
        auct = request.POST['auct']
        pers = request.POST['pers']
        cursor.execute("""INSERT INTO cars_auction_person ('auct', 'pers')
                        VALUES (%s,%s)""",
                       (auct, pers))
        return render(request, "AucPerson.html")
    else:
        # GET request, present an empty form
        form = AucPerForm()
        return render(request, 'add_auc_per.html', {"form": form})



def home(request):
    context ={}
    context['form'] = add_Auc(request)
    return render(request, "home.html", context)
    #return render(request, "home.html", {})


