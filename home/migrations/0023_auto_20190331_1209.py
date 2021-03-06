# Generated by Django 2.1.7 on 2019-03-31 12:09

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('wagtailimages', '0001_squashed_0021'),
        ('home', '0022_auto_20190331_1209'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='partneritem',
            name='partner_logo',
        ),
        migrations.AddField(
            model_name='partneritem',
            name='ptnr_logo',
            field=models.ForeignKey(blank=True, help_text="Business partner's Logo", null=True, on_delete=django.db.models.deletion.SET_NULL, to='wagtailimages.Image'),
        ),
    ]
