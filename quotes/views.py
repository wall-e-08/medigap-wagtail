from django.http import JsonResponse
from .forms import LeadForm
from django.template import Context, Template


def validate_quote_form(request):
    json = {"success": False, }
    if request.GET:
        form = LeadForm(request.GET)
        if form.is_valid():
            # form.save()   # using wagtail forms now, no need of model form
            json.update({
                "success": True,
                "msg": "Thank you for your quote!",
            })
        else:
            print("LeadForm Error: {}".format(form.errors))
            template = Template('''
               {{ errors }}
            ''')
            context = Context({"errors": form.errors})
            json["msg"] = template.render(context)
    return JsonResponse(json)




