# Generated by Django 3.1.4 on 2020-12-09 16:48

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('cars', '0003_auto_20201209_1628'),
    ]

    operations = [
        migrations.RenameField(
            model_name='vehicle',
            old_name='car_availabilty',
            new_name='car_availability',
        ),
    ]
