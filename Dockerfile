# Python Image 3.11
FROM python:3.11-slim

# Copy UV directly from the official UV image
COPY --from=ghcr.io/astral-sh/uv:0.6.14 /uv /uvx /bin/

# Create working directory
WORKDIR /app

# Copy files
COPY . .

# Install dependencies with uv
RUN uv add aiohttp>=3.11.18 \
    && uv add django>=5.2.4 \
    && uv add django-rest-swagger>=2.2.0 \
    && uv add djangorestframework>=3.16.0 \
    && uv add djangorestframework-simplejwt>=5.5.1 \
    && uv add drf-spectacular>=0.28.0 \
    && uv add requests>=2.32.3 \
    && uv add psycopg2-binary>=2.9.10 \

RUN uv sync --locked

# Command to run the app
# Permisos para el entrypoint
RUN chmod +x entrypoint.sh

EXPOSE 8000

# Usa el entrypoint para arrancar el server
CMD ["./entrypoint.sh"]