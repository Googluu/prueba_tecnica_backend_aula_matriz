# 🔐 API de Autenticacion - Prueba Tecnica

Proyecto basico de backend con Django + Django REST Framework que implementa:

- Login con JWT
- Perfil protegido por autenticacion
- Documentacin Swagger (OpenAPI)
- Frontend simple en HTML + JS para consumir la API

---

## 🚀 Tecnologias usadas

- Django 5
- Django REST Framework
- SimpleJWT
- drf-spectacular
- PostgreSQL
- Docker (para la base de datos)

---

## ⚙️ Requisitos

- Python 3.11+
- Docker (para levantar PostgreSQL)
- uv (opcional, para manejo de entorno del proyecto)

---

### 1. Clona el repositorio

```bash
1. clonar repo `git clone git@github.com:Googluu/prueba_tecnica_backend_aula_matriz.git && cd prueba_tecnica_backend_aula_matriz`
2. Inicialice `uv` (un paquete de Python extremadamente rápido y administrador de proyectos, escrito en Rust). `uv init ./`
3. Instalar las dependencias `uv sync`


### 2. Levanta PostgreSQL con Docker
Configura la base de datos en settings.py
```bash
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'loginapi',
        'USER': 'sneyder',
        'PASSWORD': 'Admin123',
        'HOST': 'localhost',
        'PORT': '5432',
    }
}
```
```bash
docker run --name pg-auth-api \
  -e POSTGRES_USER=sneyder \
  -e POSTGRES_PASSWORD=Admin123 \
  -e POSTGRES_DB=loginapi \
  -p 5432:5432 \
  -d postgres
```

### Ejecutar las migraciones y crea al superusuario
```bash
python manage.py makemigrations
python manage.py migrate
python manage.py createsuperuser
```

### Ejecutar el servidor
```bash
python manage.py runserver
```

### ejemplos de los endpoints
```bash
POST /api/login/

{
  "username": "admin",
  "password": "admin123"
}

Response:
{
  "refresh": "...",
  "access": "..."
}

GET /api/perfil/
Authorization: Bearer <access_token>
Token: eyJhbGciOiJIUzI1NiI......

Response:
{
    "username": "admin",
    "email": "admin123",
    "first_name": "",
    "last_name": ""
}

Frontend con HTML+JS
RUTA login-page/
```
