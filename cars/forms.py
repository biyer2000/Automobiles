from django import forms
from cars.models import Manufacturers

class ManuForm(forms.ModelForm):
    class Meta:
        model = Manufacturers
        fields = ('name', 'country', 'year_founded', 'revenue',)


