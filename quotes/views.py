from django.http import JsonResponse
from .forms import LeadForm
from .lead_api import LeadCampaignApi
from django.template import Context, Template


def validate_quote_form(request):
    json = {"success": False, }
    if request.GET:
        form = LeadForm(request.GET)
        if form.is_valid():
            # form.save()   # using wagtail forms now, no need of model form
            request_get_data = request.GET.dict()
            print("GET: {}".format(request_get_data))
            lead = LeadCampaignApi(**request_get_data)
            if not lead.get_lead_id():
                return JsonResponse({
                    "success": False,
                    "msg": lead.json_data.get('ResponseDetail')
                })
            json.update({
                "success": True,
                "msg": "Thank you!",
                "lead_id": lead.get_lead_id(),
            })
        else:
            print("LeadForm Error: {}".format(form.errors))
            template = Template('''
               {{ errors }}
            ''')
            context = Context({"errors": form.errors})
            json["msg"] = template.render(context)
    return JsonResponse(json)




