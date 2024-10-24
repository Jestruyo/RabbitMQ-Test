import os
import pika

rabbitmq_host = os.getenv('RABBITMQ_HOST', 'localhost')

# Conexión al servidor RabbitMQ
connection = pika.BlockingConnection(pika.ConnectionParameters(rabbitmq_host))
channel = connection.channel()

# Declarar la cola
channel.queue_declare(queue='saludo')

# Enviar un mensaje
channel.basic_publish(exchange='', routing_key='saludo', body='Hello RabbitMQ from Docker!')
print("[x] Enviado 'Hello RabbitMQ from Docker!'")

# Cerrar la conexión
connection.close()
