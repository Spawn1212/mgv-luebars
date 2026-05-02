# mgv-luebars
Erstellen einer Mitgliederverwaltung für SeniorenClub Luebars

## How to develop

'''bash
cd src/django
python3 -m venv .env
'''

## Create Startproject
'''bash
django-admin startproject root
'''

## Move Startproject
'''bash
mv root/ delitem
cp delitem/* django/
rm -r delitem
'''

## Create StartApp
'''bash
python .\manage.py startapp mgv
'''

## Create Hello-World index.html
New file under mgv -> templates/mgv/index.html
Folder automaticly createtd

### Set urlpatterns under root/urls.py
urlpatterns = [
    path('', include('mgv.urls')),
    path('admin/', admin.site.urls)
]

### Set urlpatterns under mgv/urls.py
urlpatterns = [
    path('', views.index, name='index'),
]

## settings.py
TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [
                BASE_DIR / 'root/templates',
                BASE_DIR / 'mgv/templates',
        ]
    }]

Now you can run the 'run_development.sh' file.

