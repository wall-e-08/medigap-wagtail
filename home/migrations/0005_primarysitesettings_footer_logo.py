# Generated by Django 2.1.7 on 2019-03-24 11:20

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0004_auto_20190324_1119'),
    ]

    operations = [
        migrations.AddField(
            model_name='primarysitesettings',
            name='footer_logo',
            field=models.ImageField(blank=True, help_text='Logo for footer (dark)', null=True, upload_to='home/'),
        ),
    ]