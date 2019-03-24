from django.db import models

from modelcluster.fields import ParentalKey
from modelcluster.models import ClusterableModel

from wagtail.admin.edit_handlers import FieldPanel, InlinePanel
from wagtail.core.models import Page, Orderable
from wagtail.contrib.settings.models import BaseSetting
from wagtail.contrib.settings.registry import register_setting


@register_setting(icon='pick')
class PrimarySiteSettings(BaseSetting):
    favicon = models.ImageField(
        blank=True, null=True, upload_to='home/',
        help_text="Icon in title bar"
    )

    logo = models.ImageField(
        blank=True, null=True, upload_to='home/',
        help_text="Navbar Logo (Dark). Max height fixed by CSS"
    )

    footer_logo = models.ImageField(
        blank=True, null=True, upload_to='home/',
        help_text="Footer Logo (light)"
    )

    phone_number = models.CharField(blank=True, null=True, max_length=20)

    txt_ph_nmb = models.CharField(
        blank=True, null=True, max_length=150,
        help_text="Text below phone number in Top",
        verbose_name="Text below Phone No.(top)"
    )

    qt_heading = models.CharField(
        blank=True, null=True, max_length=250,
        help_text="QUOTE Heading in Pop-up form",
        verbose_name="Quote Heading",
    )

    class Meta:
        verbose_name = 'Site Identity'


@register_setting(icon='grip')
class SocialMediaSettings(BaseSetting, ClusterableModel):
    panels = [
        InlinePanel('sm_settings_panel', label="New Social Media")
    ]

    class Meta:
        verbose_name = 'Social Media'


@register_setting(icon='redirect')
class ContactSettings(BaseSetting, ClusterableModel):
    contact_desc = models.CharField(
        max_length=255,
        blank=True, null=True,
        verbose_name="Pre-contact Text",
    )

    panels = [
        InlinePanel('contact_settings_panel', label="New Contact info", max_num=4),
    ]

    class Meta:
        verbose_name = 'Contact Info'


class HomePage(Page):
    max_count = 1
    subpage_types = []
    parent_page_types = ['wagtailcore.Page']

    # banner
    banner_slogan = models.CharField(blank=True, null=True, max_length=150)
    banner_bg = models.ImageField(
        blank=True, null=True, upload_to='home/',
        help_text="Background Image of Banner"
    )
    banner_qt_text = models.CharField(
        blank=True, null=True, max_length=250,
        help_text="Text below QUOTE Form in Banner",
        verbose_name="Banner QUOTE Text",
    )

    content_panels = Page.content_panels + [
        FieldPanel('banner_slogan'), FieldPanel('banner_bg'), FieldPanel('banner_qt_text'),
        InlinePanel('achievement_count', label="Achievement Name & Count"),
    ]


class AchievementCount(Orderable):
    page = ParentalKey(
        HomePage,
        on_delete=models.CASCADE,
        related_name='achievement_count'
    )

    name = models.CharField(max_length=50, help_text="Name of the Achievement")
    count = models.CharField(max_length=6, help_text="Achievement counts (eg: 5,000)")

    panels = [
        FieldPanel('name'),
        FieldPanel('count'),
    ]


# settings orderable item
class SocialItem(Orderable):
    SOCIAL_CHOICES = (
        ('fa fa-facebook', 'Facebook'),
        ('fa fa-twitter', 'Twitter'),
        ('fa fa-skype', 'Skype'),
        ('fa fa-youtube', 'Youtube'),
        ('fa-instagram', 'Instagram'),
        ('fa fa-pinterest', 'Pinterest'),
        ('fa fa-linkedin', 'LinkedIn'),
        ('fa fa-envelope', 'Email'),
    )

    sm_settings = ParentalKey(
        'SocialMediaSettings',
        on_delete=models.CASCADE,
        related_name='sm_settings_panel'
    )
    sm_icon = models.CharField(
        choices=SOCIAL_CHOICES,
        max_length=50,
        verbose_name="Name",
    )
    sm_url = models.URLField(
        max_length=255,
        verbose_name="Link/Url",
    )

    panels = [
        FieldPanel('sm_icon'),
        FieldPanel('sm_url'),
    ]


class ContactItem(Orderable):
    SOCIAL_CHOICES = (
        ('fa fa-map-marker', 'Location'),
        ('fa fa-phone', 'Phone'),
        ('fa fa-envelope-o', 'E-mail'),
        ('fa fa-globe', 'Website'),
    )

    sm_settings = ParentalKey(
        ContactSettings,
        on_delete=models.CASCADE,
        related_name='contact_settings_panel'
    )
    contact_icon = models.CharField(
        choices=SOCIAL_CHOICES,
        max_length=50,
        verbose_name="Type",
    )
    contact_text = models.CharField(
        max_length=255,
        verbose_name="Details",
    )
    contact_url = models.URLField(
        max_length=255,
        verbose_name="Link/Url",
    )

    panels = [
        FieldPanel('contact_icon'),
        FieldPanel('contact_text'),
        FieldPanel('contact_url'),
    ]
