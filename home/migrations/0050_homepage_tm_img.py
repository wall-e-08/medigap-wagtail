# Generated by Django 2.1.7 on 2019-04-15 09:15

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('wagtailimages', '0001_squashed_0021'),
        ('home', '0049_testimonial_msg'),
    ]

    operations = [
        migrations.AddField(
            model_name='homepage',
            name='tm_img',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='tm_bg_img', to='wagtailimages.Image', verbose_name='Background Image'),
        ),
    ]