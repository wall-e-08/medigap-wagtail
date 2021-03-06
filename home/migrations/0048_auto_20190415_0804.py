# Generated by Django 2.1.7 on 2019-04-15 08:04

from django.db import migrations, models
import django.db.models.deletion
import modelcluster.fields


class Migration(migrations.Migration):

    dependencies = [
        ('wagtailimages', '0001_squashed_0021'),
        ('home', '0047_auto_20190415_0607'),
    ]

    operations = [
        migrations.CreateModel(
            name='Testimonial',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('sort_order', models.IntegerField(blank=True, editable=False, null=True)),
                ('name', models.CharField(blank=True, max_length=150, null=True)),
                ('location', models.CharField(blank=True, max_length=200, null=True)),
                ('img', models.ForeignKey(blank=True, help_text="Client's Photo (square image preferred)", null=True, on_delete=django.db.models.deletion.SET_NULL, to='wagtailimages.Image', verbose_name='Photo')),
            ],
            options={
                'ordering': ['sort_order'],
                'abstract': False,
            },
        ),
        migrations.AddField(
            model_name='homepage',
            name='tm_desc',
            field=models.CharField(blank=True, max_length=250, null=True, verbose_name='Description'),
        ),
        migrations.AddField(
            model_name='homepage',
            name='tm_heading',
            field=models.CharField(blank=True, help_text='Main Heading, use <span> tag for colored text', max_length=100, null=True, verbose_name='Heading'),
        ),
        migrations.AddField(
            model_name='testimonial',
            name='page',
            field=modelcluster.fields.ParentalKey(on_delete=django.db.models.deletion.CASCADE, related_name='client_testimonial', to='home.HomePage'),
        ),
    ]
