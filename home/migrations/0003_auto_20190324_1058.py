# Generated by Django 2.1.7 on 2019-03-24 10:58

from django.db import migrations, models
import django.db.models.deletion
import modelcluster.fields


class Migration(migrations.Migration):

    dependencies = [
        ('wagtailcore', '0041_group_collection_permissions_verbose_name_plural'),
        ('home', '0002_create_homepage'),
    ]

    operations = [
        migrations.CreateModel(
            name='AchievementCount',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('sort_order', models.IntegerField(blank=True, editable=False, null=True)),
                ('name', models.CharField(help_text='Name of the Achievement', max_length=50)),
                ('count', models.CharField(help_text='Achievement counts (eg: 5,000)', max_length=6)),
            ],
            options={
                'ordering': ['sort_order'],
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='PrimarySiteSettings',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('favicon', models.ImageField(blank=True, help_text='Icon in title bar', null=True, upload_to='home/')),
                ('logo', models.ImageField(blank=True, help_text='Max height fixed by CSS', null=True, upload_to='home/')),
                ('phone_number', models.CharField(blank=True, max_length=20, null=True)),
                ('txt_ph_nmb', models.CharField(blank=True, help_text='Text below phone number in Top', max_length=150, null=True, verbose_name='Text below Phone No.(top)')),
                ('site', models.OneToOneField(editable=False, on_delete=django.db.models.deletion.CASCADE, to='wagtailcore.Site')),
            ],
            options={
                'verbose_name': 'Site Identity',
            },
        ),
        migrations.AddField(
            model_name='homepage',
            name='banner_bg',
            field=models.ImageField(blank=True, help_text='Background Image of Banner', null=True, upload_to='home/'),
        ),
        migrations.AddField(
            model_name='homepage',
            name='banner_qt_text',
            field=models.CharField(blank=True, help_text='Text below QUOTE Form in Banner', max_length=250, null=True, verbose_name='Banner QUOTE Text'),
        ),
        migrations.AddField(
            model_name='homepage',
            name='banner_slogan',
            field=models.CharField(blank=True, max_length=150, null=True),
        ),
        migrations.AddField(
            model_name='homepage',
            name='qt_heading',
            field=models.CharField(blank=True, help_text='QUOTE Heading in Pop-up form', max_length=250, null=True, verbose_name='Quote Heading'),
        ),
        migrations.AddField(
            model_name='achievementcount',
            name='page',
            field=modelcluster.fields.ParentalKey(on_delete=django.db.models.deletion.CASCADE, related_name='achievement_count', to='home.HomePage'),
        ),
    ]
