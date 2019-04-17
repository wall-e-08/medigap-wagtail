import requests
from django.conf import settings
import xml.etree.ElementTree as ET


class LeadCampaignApi(object):
    lead_api_url = settings.LEAD_GATEWAY_ADDRESS
    camp_id = settings.LEAD_CAMPAIGN_ID

    def __init__(self, **kwargs):
        self.is_test = settings.IS_LEAD_TEST

        try:
            self.f_name = kwargs['first_name']
            self.l_name = kwargs['last_name']
            self.email = kwargs['email']
            self.phone_nmb = kwargs['phone']
            self.us_state = kwargs['state']
            self.zip_code = kwargs['zip_code']
        except KeyError as err:
            print("Wrong form data provided.. \nError: {}\n".format(err))
            self.f_name = ''
            self.l_name = ''
            self.email = ''
            self.phone_nmb = ''
            self.us_state = ''
            self.zip_code = ''

        self.error = None
        self.data = None
        self.json_data = {}
        self.content = {
            "CampaignId": "{}".format(self.camp_id),
            "IsTest": "{}".format(self.is_test),
            "FirstName": "{}".format(self.f_name),
            "LastName": "{}".format(self.l_name),
            "Email": "{}".format(self.email),
            "Phone": "{}".format(self.phone_nmb),
            "State": "{}".format(self.us_state),
            "Zip": "{}".format(self.zip_code),
        }

    def get_response(self):
        # print("api url: ", self.lead_api_url)
        # print("content for api: ", self.content)
        try:
            response = requests.post(self.lead_api_url, data=self.content)
            if response.status_code == 200:
                self.data = response.text.replace('ï»¿', '')
                # print("Got data: {}".format(self.data))
                return self.data
            else:
                print("Request response code: {}".format(response.status_code))
        except requests.exceptions.RequestException as err:
            print("request error - {}: {}".format(self.__class__.__name__, err))
        return None

    def get_lead_id(self):
        self.get_response()
        root = ET.ElementTree(ET.fromstring(self.data)).getroot()
        json_data = {}
        for child in root:
            print("Tag: {}, Attr: {}, Txt: {}".format(child.tag, child.attrib, child.text))
            json_data[child.tag] = child.text
        print("\n\nJSON DATA: \n{}\n".format(json_data))
        self.json_data = json_data
        if json_data.get('IsValid') and json_data.get('IsValid') == 'True':
            print("Lead id: {}".format(json_data.get('LeadId')))
            return json_data.get('LeadId')
        return None


