import string
import datetime
from django import forms
from django.utils.translation import ugettext_lazy as _

from .models import Lead


class LeadForm(forms.Form):
    APPLICANT_MAX_AGE = 64
    APPLICANT_MIN_AGE = 2

    first_name = forms.CharField(required=True,)
    middle_name = forms.CharField(required=False,)
    last_name = forms.CharField(required=True,)
    email = forms.CharField(required=True,)
    phone = forms.CharField(required=True,)
    alternate_phone = forms.CharField(required=True,)
    date_of_birth = forms.DateField(
        input_formats=['%m-%d-%Y', '%m/%d/%Y'],
        required=True,
    )
    zip_code = forms.CharField(required=True,)

    @staticmethod
    def age(date_of_birth):
        today = datetime.date.today()
        if today.month < date_of_birth.month or (today.month == date_of_birth.month and today.day < date_of_birth.day):
            return today.year - date_of_birth.year - 1
        return today.year - date_of_birth.year

    def clean_zip_code(self):
        zip_code = self.cleaned_data['zip_code']
        if not zip_code:
            return None
        for char in zip_code:
            if char not in string.digits:
                raise forms.ValidationError(_("Invalid zip code"))
        if len(zip_code) != 5:
            raise forms.ValidationError(_('Invalid zip code'))
        return zip_code

    def clean_date_of_birth(self):
        date_of_birth = self.cleaned_data['date_of_birth']
        if not date_of_birth:
            return None
        if date_of_birth > datetime.date.today():
            print(datetime.date.today())
            raise forms.ValidationError(_("Future Date is not a valid Date of Birth"), code='invalid')
        if self.age(date_of_birth) > self.APPLICANT_MAX_AGE:
            raise forms.ValidationError(_("Applicant maximum age is {} years.".format(self.APPLICANT_MAX_AGE)), code='limit')
        if self.age(date_of_birth) < self.APPLICANT_MIN_AGE:
            raise forms.ValidationError(_("Applicant minimum age is {} years.".format(self.APPLICANT_MIN_AGE)), code='limit')
        return date_of_birth
