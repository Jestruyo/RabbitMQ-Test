# Usamos una imagen base de Python
FROM python:3.10-slim

# Instalar dependencias necesarias para RabbitMQ y otras utilidades
RUN apt-get update && apt-get install -y curl gnupg netcat-openbsd

# Instalar pika (cliente de RabbitMQ para Python)
RUN pip install pika

# Crear directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiar los scripts de productor y consumidor a la carpeta de trabajo
COPY . .

# Copiar wait-for-it.sh al contenedor
COPY wait-for-it.sh /wait-for-it.sh
RUN chmod +x /wait-for-it.sh

# Exponer los puertos necesarios
EXPOSE 5672 15672
