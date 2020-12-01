from django.contrib import admin

# Register your models here.
from django.contrib import admin

from .models import Manufacturers
from .models import Vehicle
from .models import Cars
from .models import Auction
from .models import Auction_Person
from .models import Person

admin.site.register(Manufacturers)
admin.site.register(Vehicle)
admin.site.register(Cars)
admin.site.register(Auction)
admin.site.register(Auction_Person)
admin.site.register(Person)