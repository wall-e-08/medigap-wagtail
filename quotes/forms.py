import string
import datetime
from django import forms
from django.utils.translation import ugettext_lazy as _

from .models import Lead


class LeadForm(forms.ModelForm):
    APPLICANT_MAX_AGE = 64
    APPLICANT_MIN_AGE = 2

    dob = forms.DateField(
        label=_("Date of Birth"),
        input_formats=['%m-%d-%Y', '%m/%d/%Y'],
        required=False,
    )
    middle_name = forms.CharField(required=False)

    class Meta:
        model = Lead
        exclude = ['created_time', ]

    @staticmethod
    def age(dob):
        today = datetime.date.today()
        if today.month < dob.month or (today.month == dob.month and today.day < dob.day):
            return today.year - dob.year - 1
        return today.year - dob.year

    def clean_zip_code(self):
        zip_code = self.cleaned_data['zip_code']
        for char in zip_code:
            if char not in string.digits:
                raise forms.ValidationError(_("Invalid zip code"))
        if len(zip_code) != 5:
            raise forms.ValidationError(_('Invalid zip code'))
        return zip_code

    def clean_dob(self):
        dob = self.cleaned_data['dob']
        if dob > datetime.date.today():
            print(datetime.date.today())
            raise forms.ValidationError(_("Future Date is not a valid Date of Birth"), code='invalid')
        if self.age(dob) > self.APPLICANT_MAX_AGE:
            raise forms.ValidationError(_("Applicant maximum age is {} years.".format(self.APPLICANT_MAX_AGE)), code='limit')
        if self.age(dob) < self.APPLICANT_MIN_AGE:
            raise forms.ValidationError(_("Applicant minimum age is {} years.".format(self.APPLICANT_MIN_AGE)), code='limit')
        return dob
