from django.db import models

from modelcluster.fields import ParentalKey
from modelcluster.models import ClusterableModel

from wagtail.admin.edit_handlers import FieldPanel, InlinePanel, TabbedInterface, ObjectList
from wagtail.core.models import Page, Orderable
from wagtail.contrib.settings.models import BaseSetting
from wagtail.contrib.settings.registry import register_setting
from wagtail.images.edit_handlers import ImageChooserPanel


@register_setting(icon='pick')
class PrimarySiteSettings(BaseSetting):
    favicon = models.ForeignKey(
        'wagtailimages.Image',
        on_delete=models.SET_NULL,
        blank=True, null=True,
        help_text="Icon in title bar",
        related_name='favicon'
    )

    logo = models.ForeignKey(
        'wagtailimages.Image',
        on_delete=models.SET_NULL,
        blank=True, null=True,
        help_text="Navbar Logo (Dark). Max height fixed by CSS",
        related_name='logo'
    )

    footer_logo = models.ForeignKey(
        'wagtailimages.Image',
        on_delete=models.SET_NULL,
        blank=True, null=True,
        help_text="Footer Logo (light)",
        related_name='footer_logo'
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

    copyright_text = models.CharField(blank=True, null=True, max_length=250)

    base_panel = [FieldPanel('qt_heading'), FieldPanel('copyright_text'), ]
    phone_panel = [FieldPanel('phone_number'), FieldPanel('txt_ph_nmb'), ]

    img_panel = [
        ImageChooserPanel('favicon'),
        ImageChooserPanel('logo'),
        ImageChooserPanel('footer_logo'),
    ]

    edit_handler = TabbedInterface([
        ObjectList(img_panel, heading='Images'),
        ObjectList(base_panel, heading='Base'),
        ObjectList(phone_panel, heading='Phone number'),
    ])

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


@register_setting(icon='image')
class PartnerImgSettings(BaseSetting, ClusterableModel):
    panels = [
        InlinePanel('partner_img_panel', label="New Partner")
    ]

    class Meta:
        verbose_name = 'Partner Logo'


class HomePage(Page):
    max_count = 1
    subpage_types = []
    parent_page_types = ['wagtailcore.Page']

    # banner
    banner_slogan = models.CharField(blank=True, null=True, max_length=150)
    banner_bg = models.ForeignKey(
        'wagtailimages.Image',
        on_delete=models.SET_NULL,
        blank=True, null=True,
        help_text="Background Image of Banner"
    )
    banner_qt_text = models.CharField(
        blank=True, null=True, max_length=250,
        help_text="Text below QUOTE Form in Banner",
        verbose_name="Banner QUOTE Text",
    )

    content_panels = Page.content_panels + [
        FieldPanel('banner_slogan'), ImageChooserPanel('banner_bg'), FieldPanel('banner_qt_text'),
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


class PartnerItem(Orderable):
    main_settings = ParentalKey(
        PartnerImgSettings,
        on_delete=models.CASCADE,
        related_name='partner_img_panel'
    )

    logo = models.ForeignKey(
        'wagtailimages.Image',
        on_delete=models.SET_NULL,
        blank=True, null=True,
        help_text="Business partner's Logo"
    )

    alt_text = models.CharField(
        max_length=250,
        blank=True, null=True,
    )

    ptnr_url =  models.URLField(
        max_length=255,
        blank=True, null=True,
        verbose_name="Pertner's website",
    )

    panels = [
        ImageChooserPanel('logo'),
        FieldPanel('alt_text'),
        FieldPanel('ptnr_url'),
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

    cnct_settings = ParentalKey(
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
