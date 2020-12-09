from django import forms
from cars.models import Manufacturers,Auction,Cars, Vehicle, Person, Auction_Person

class ManuForm(forms.ModelForm):
    class Meta:
        model = Manufacturers
        fields = ('name', 'country', 'year_founded', 'revenue',)

class AucForm(forms.ModelForm):
    class Meta:
        model = Auction
        fields = ('capacity', 'city', 'state', 'auc_date', 'start_time', 'end_time', 'no_of_cars')


class VecForm(forms.ModelForm):
    class Meta:
        model = Vehicle
        fields = ('manufacturer', 'model_name','no_of_doors', 'mpg', 'car_availability', 'seating_capacity','vehicle_type')


class CarForm(forms.ModelForm):
    class Meta:
        model = Cars
        fields = ('manufacturer', 'vin', 'plate_no', 'no_of_accidents', 'year', 'model', 'color', 'base_price', 'owner')


class PerForm(forms.ModelForm):
    class Meta:
        model = Person
        fields = ('name', 'dob', 'vehicle_preference')


class AucPerForm(forms.ModelForm):
    class Meta:
        model = Auction_Person
        fields = ('auct', 'pers')
