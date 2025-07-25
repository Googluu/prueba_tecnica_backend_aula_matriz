#!/bin/bash

# Espera a que la base de datos este disponible si usas PostgreSQL
echo "Esperando a la base de datos..."
sleep 3

# Ejecuta migraciones, collectstatic y corre el servidor
python manage.py migrate --noinput
python manage.py collectstatic --noinput

# Inicia el servidor en el puerto que Railway espera
gunicorn backend.wsgi:application --bind 0.0.0.0:$PORT
