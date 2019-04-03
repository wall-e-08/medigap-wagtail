from django.db import models

from modelcluster.fields import ParentalKey
from modelcluster.models import ClusterableModel

from wagtail.admin.edit_handlers import (FieldPanel, InlinePanel, TabbedInterface,
                                         ObjectList, MultiFieldPanel, StreamFieldPanel)
from wagtail.core import blocks
from wagtail.core.fields import RichTextField, StreamField
from wagtail.core.models import Page, Orderable
from wagtail.contrib.settings.models import BaseSetting
from wagtail.contrib.settings.registry import register_setting
from wagtail.images.blocks import ImageChooserBlock
from wagtail.images.edit_handlers import ImageChooserPanel

from core.settings.base import RICH_TEXT_FEATURE_TYPE_A

SPAN_TAG_HELP_TEXT = 'use <span> tag for colored text'


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


# Blocks
class FacilityBlock(blocks.StructBlock):
    title = blocks.CharBlock(required=True, help_text="Add your title")
    image = ImageChooserBlock(required=True, help_text="White colored image preferred")
    desc = blocks.TextBlock(required=True, max_length=500, verbose_name="Description")

    class Meta:
        template = "blocks/facility_block.html"
        icon = "placeholder"
        label = "Insurance Facilities"


class HomePage(Page):
    max_count = 1
    subpage_types = ['article.ArticleIndexPage', 'home.SimplePage']
    parent_page_types = ['wagtailcore.Page']

    # banner
    banner_slogan = models.CharField(blank=True, null=True, max_length=150)
    banner_bg = models.ForeignKey(
        'wagtailimages.Image',
        on_delete=models.SET_NULL,
        blank=True, null=True,
        help_text="Background Image of Banner",
        related_name="banner_bg",
    )
    banner_qt_text = models.CharField(
        blank=True, null=True, max_length=250,
        help_text="Text below QUOTE Form in Banner",
        verbose_name="Banner QUOTE Text",
    )

    # Why Choose Us / About
    why_choose_heading = models.CharField(
        blank=True, null=True, max_length=250,
        help_text="Main Heading, " + SPAN_TAG_HELP_TEXT,
        verbose_name="Heading"
    )

    why_choose_desc = RichTextField(
        blank=True, null=True,
        features=RICH_TEXT_FEATURE_TYPE_A,
        help_text="description of 'Why choose us' section",
        verbose_name="Description",
    )
    why_choose_img = models.ForeignKey(
        'wagtailimages.Image',
        on_delete=models.SET_NULL,
        blank=True, null=True,
        help_text="Why Choose Image (Transparent Image will give satisfactory result)",
        verbose_name="Side Image",
        related_name="why_choose_img",
    )

    # Achievement
    achiev_bg = models.ForeignKey(
        'wagtailimages.Image',
        on_delete=models.SET_NULL,
        blank=True, null=True,
        help_text="Parallax Background image for Achievement section",
        verbose_name="Background Image",
        related_name="achievement_bg",
    )

    # Services
    srvc_heading = models.CharField(
        blank=True, null=True, max_length=100,
        help_text="Main Heading, " + SPAN_TAG_HELP_TEXT,
        verbose_name="Heading",
    )
    srvc_desc = models.CharField(
        blank=True, null=True, max_length=250,
        verbose_name="Description",
    )

    # Insurance Policilies
    ins_heading = models.CharField(
        blank=True, null=True, max_length=100,
        help_text="Main Heading, " + SPAN_TAG_HELP_TEXT,
        verbose_name="Heading",
    )
    ins_desc = models.CharField(
        blank=True, null=True, max_length=250,
        verbose_name="Description",
    )

    content_panels = Page.content_panels + [
        FieldPanel('banner_slogan'), ImageChooserPanel('banner_bg'), FieldPanel('banner_qt_text'),
        MultiFieldPanel(
            [
                FieldPanel('why_choose_heading'),
                FieldPanel('why_choose_desc', classname="full"),
                ImageChooserPanel('why_choose_img'),
                InlinePanel('whychoose_icontext', label="List of Why Choose Us"),
            ],
            heading="Why Choose Us", classname="collapsible",
        ),
        MultiFieldPanel(
            [
                ImageChooserPanel('achiev_bg'),
                InlinePanel('achievement_count', label="Name & Count"),
            ],
            heading="Achievement", classname="collapsible",
        ),
        MultiFieldPanel(
            [
                FieldPanel('srvc_heading'),
                FieldPanel('srvc_desc'),
                InlinePanel('services_icontext', label="Icons with Texts"),
            ],
            heading="Services", classname="collapsible",
        ),
        MultiFieldPanel(
            [
                FieldPanel('ins_heading'),
                FieldPanel('ins_desc'),
                InlinePanel('ins_policy', label="Policy"),
            ],
            heading="Insurance Policy", classname="collapsible",
        ),
    ]


class SimplePage(Page):
    subpage_types = []  # no sub-page allowed
    parent_page_types = ['home.HomePage', ]
    template = 'home/simple_page.html'

    heading_bg = models.ForeignKey(
        'wagtailimages.Image',
        on_delete=models.SET_NULL,
        blank=True, null=True,
        help_text="Background Image in Heading/Title",
        related_name="heading_bg",
    )

    slogan_txt = RichTextField(
        blank=True, null=True,
        features=RICH_TEXT_FEATURE_TYPE_A,
        verbose_name="Slogan Text",
    )
    slogan_img = models.ForeignKey(
        'wagtailimages.Image',
        on_delete=models.SET_NULL,
        blank=True, null=True,
        help_text="Slogan Background Image",
        related_name="slogan_img",
    )

    content = RichTextField(
        blank=True, null=True,
        features=RICH_TEXT_FEATURE_TYPE_A,
        verbose_name="Main Content",
    )

    content_panels = [
        MultiFieldPanel(
            [
                FieldPanel('title'),
                ImageChooserPanel('heading_bg'),
                FieldPanel('content', classname="full"),
            ],
            heading="Page Identity", classname="collapsible",
        ),
        MultiFieldPanel(
            [
                FieldPanel('slogan_txt'),
                ImageChooserPanel('slogan_img'),
            ],
            heading="Slogan", classname="collapsible",
        ),
    ]

    def get_context(self, request):
        context = super(SimplePage, self).get_context(request)
        context['home_page'] = HomePage.objects.first()
        return context


class BaseIconText(models.Model):
    icon = models.CharField(
        max_length=50,
        help_text="Font awesome(mainly) or Flat icon CSS class name",
        verbose_name='Icon CSS Class name',
    )
    name = models.CharField(max_length=80, help_text="Option's name")
    desc = models.CharField(max_length=200, help_text="Option's description", verbose_name='Description')


class AchievementCount(Orderable):
    page = ParentalKey(
        HomePage,
        on_delete=models.CASCADE,
        related_name='achievement_count'
    )

    name = models.CharField(max_length=50, help_text="Name of the Achievement")
    count = models.IntegerField(help_text="Achievement counts (eg: 5000)")
    icon = models.CharField(
        max_length=50,
        help_text="Font awesome(mainly) or Flat icon CSS class name",
        verbose_name='Icon CSS Class name',
    )

    panels = [
        FieldPanel('name'),
        FieldPanel('count'),
        FieldPanel('icon'),
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


class WhyChooseIconText(Orderable, BaseIconText):
    page = ParentalKey(
        HomePage,
        on_delete=models.CASCADE,
        related_name='whychoose_icontext'
    )

    panels = [
        FieldPanel('name'),
        FieldPanel('icon'),
        FieldPanel('desc'),
    ]


class ServicesIconText(Orderable, BaseIconText):
    page = ParentalKey(
        HomePage,
        on_delete=models.CASCADE,
        related_name='services_icontext'
    )

    panels = [
        FieldPanel('name'),
        FieldPanel('icon'),
        FieldPanel('desc'),
    ]


class InsurancePolicy(Orderable):
    page = ParentalKey(
        HomePage,
        on_delete=models.CASCADE,
        related_name='ins_policy'
    )

    name = models.CharField(max_length=50)
    desc = RichTextField(
        features=RICH_TEXT_FEATURE_TYPE_A,
        verbose_name="Description",
    )
    img = models.ForeignKey(
        'wagtailimages.Image',
        on_delete=models.SET_NULL,
        blank=True, null=True,
        help_text="Image Besides Insurance Policy",
        verbose_name="Side Image"
    )

    facilities = StreamField(
        [("facility", FacilityBlock()),],
        blank=True, null=True,
        verbose_name="Insurance Facilities",
    )

    panels = [
        FieldPanel('name'),
        FieldPanel('desc'),
        ImageChooserPanel('img'),
        StreamFieldPanel("facilities"),
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
