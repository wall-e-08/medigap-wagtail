# Generated by Django 2.1.7 on 2019-04-04 07:19

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('article', '0006_articlepage_hit_count'),
    ]

    operations = [
        migrations.AlterField(
            model_name='articlepage',
            name='hit_count',
            field=models.IntegerField(default=0, editable=False),
        ),
    ]
