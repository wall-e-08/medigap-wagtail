# Generated by Django 2.1.7 on 2019-04-24 11:33

from django.db import migrations, models
import wagtail.core.fields


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0055_auto_20190423_1605'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='primarysitesettings',
            name='qt_heading',
        ),
        migrations.AddField(
            model_name='primarysitesettings',
            name='qt_btn_txt',
            field=models.CharField(blank=True, help_text='QUOTE button text in quote form page', max_length=250, null=True, verbose_name='Quote Button Text'),
        ),
        migrations.AddField(
            model_name='primarysitesettings',
            name='qt_slogan',
            field=wagtail.core.fields.RichTextField(blank=True, null=True, verbose_name='Quote Slogan'),
        ),
        migrations.AlterField(
            model_name='primarysitesettings',
            name='qt_disclaimer',
            field=wagtail.core.fields.RichTextField(blank=True, help_text='Quote Disclaimer in quote form page', null=True, verbose_name='Quote Disclaimer'),
        ),
    ]
