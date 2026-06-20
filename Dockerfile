FROM python:3.11-slim

# Evita archivos .pyc y fuerza salida sin buffer en logs
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /app

# Instalar dependencias primero para aprovechar la cache de Docker
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copiar el codigo de la aplicacion
COPY . .

# Puerto en el que corre el servicio (ver README / variable PORT)
EXPOSE 8082

# Ejecutar la aplicacion
CMD ["python", "app.py"]
