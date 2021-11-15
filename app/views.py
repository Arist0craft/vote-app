from django.shortcuts import redirect, reverse


def to_polls(request):
    return redirect(reverse("polls:index"))
