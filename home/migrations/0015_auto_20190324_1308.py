# Generated by Django 2.1.7 on 2019-03-24 13:08

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0014_partneritem_ptnr_url'),
    ]

    operations = [
        migrations.AlterField(
            model_name='partneritem',
            name='ptnr_url',
            field=models.URLField(blank=True, max_length=255, null=True, verbose_name="Pertner's website"),
        ),
    ]
