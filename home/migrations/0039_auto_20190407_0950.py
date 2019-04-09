# Generated by Django 2.1.7 on 2019-04-07 09:50

from django.db import migrations
import wagtail.core.fields


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0038_primarysitesettings_qt_disclaimer'),
    ]

    operations = [
        migrations.AlterField(
            model_name='primarysitesettings',
            name='qt_disclaimer',
            field=wagtail.core.fields.RichTextField(blank=True, help_text='Quote Disclaimer in pop-up form (<span> & <a> tags are colored)', null=True, verbose_name='Quote Disclaimer'),
        ),
    ]