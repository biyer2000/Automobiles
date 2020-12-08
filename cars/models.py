from django.db import models

# Create your models here.


class Manufacturers(models.Model):
    name = models.CharField(max_length=40)
    country = models.CharField(max_length=12)
    year_founded = models.IntegerField()
    revenue = models.FloatField()



class Vehicle(models.Model):
    manufacturer = models.ForeignKey(Manufacturers, on_delete=models.CASCADE)
    model_name = models.CharField(max_length=40)
    no_of_doors = models.IntegerField()
    mpg = models.FloatField()
    car_availabilty = models.IntegerField()
    seating_capacity = models.IntegerField()
    vehicle_type = models.CharField(max_length = 10)


class Person(models.Model):
    name = models.CharField(max_length = 50)
    dob = models.DateField()
    vehicle_preference = models.CharField(max_length=20)


class Auction(models.Model):
    capacity = models.IntegerField()
    city = models.CharField(max_length=30)
    state = models.CharField(max_length = 30)

    auc_date = models.DateField()
    start_time = models.TimeField()
    end_time = models.TimeField()
    no_of_cars = models.IntegerField()


class Auction_Person(models.Model):
    auct = models.ForeignKey(Auction, on_delete=models.CASCADE)
    pers = models.ForeignKey(Person, on_delete=models.CASCADE)







class Cars(models.Model):
    manufacturer = models.ForeignKey(Manufacturers, on_delete=models.CASCADE)
    vin = models.CharField(max_length=17)
    plate_no = models.CharField(max_length=8)
    no_of_accidents = models.IntegerField(default=0)
    year = models.IntegerField()
    model = models.CharField(max_length = 10)
    color = models.CharField(max_length = 8)
    base_price = models.FloatField()
    owner = models.ForeignKey(Person, on_delete=models.CASCADE)


