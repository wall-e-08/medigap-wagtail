# Generated by Django 2.1.7 on 2019-04-21 10:46

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0052_auto_20190415_1018'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='partnerimgsettings',
            name='site',
        ),
        migrations.RemoveField(
            model_name='partneritem',
            name='logo',
        ),
        migrations.RemoveField(
            model_name='partneritem',
            name='main_settings',
        ),
        migrations.DeleteModel(
            name='PartnerImgSettings',
        ),
        migrations.DeleteModel(
            name='PartnerItem',
        ),
    ]