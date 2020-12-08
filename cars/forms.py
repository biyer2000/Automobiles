from django import forms
from cars.models import Manufacturers
from cars.models import Auction

class ManuForm(forms.ModelForm):
    class Meta:
        model = Manufacturers
        fields = ('name', 'country', 'year_founded', 'revenue',)

class AucForm(forms.ModelForm):
    class Meta:
        model = Auction
        fields = ('capacity', 'city', 'state', 'auc_date', 'start_time', 'end_time', 'no_of_cars')


