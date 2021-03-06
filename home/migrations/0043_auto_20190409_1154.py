# Generated by Django 2.1.7 on 2019-04-09 11:54

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0042_auto_20190409_1132'),
    ]

    operations = [
        migrations.AlterField(
            model_name='homepage',
            name='banner_bg',
            field=models.ForeignKey(blank=True, help_text='Background Image of Banner', null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='banner_bg', to='wagtailimages.Image', verbose_name='Background Image'),
        ),
        migrations.AlterField(
            model_name='homepage',
            name='banner_qt_text',
            field=models.CharField(blank=True, help_text='Text below QUOTE Form in Banner', max_length=250, null=True, verbose_name='Quote form text'),
        ),
        migrations.AlterField(
            model_name='homepage',
            name='banner_slogan',
            field=models.CharField(blank=True, max_length=150, null=True, verbose_name='Slogan'),
        ),
    ]
