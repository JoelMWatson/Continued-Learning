from django.http import Http404, HttpResponseNotFound, HttpResponseRedirect
from django.shortcuts import render
from django.urls import reverse

challenges = {
    'january': 'January Challenge',
    'february': 'February Challenge',
    'march': 'March Challenge',
    'april': 'April Challenge',
    'may': 'May Challenge',
    'june': 'June Challenge',
    'july': 'July Challenge',
    'august': 'August Challenge',
    'september': 'September Challenge',
    'october': 'October Challenge',
    'november': 'November Challenge',
    'december': None
}

# Create your views here.
def index(request):
    months = list(challenges.keys())

    return render(request, "challenges/index.html", {
        'months': months
    })

def monthly_challenge(request, month):
    try:
        challenge = challenges[month]
        return render(request, "challenges/challenge.html", {
            'month': month,
            'challenge': challenge
        })
    except:
        raise Http404()
    
def monthly_challenge_by_number(request, month):
    try:
        months = list(challenges.keys())
        redirect = reverse('month-challenge', args=[months[month-1]])
        return HttpResponseRedirect(redirect)
    except:
        raise Http404()
