import os
import pika
import time

rabbitmq_host = os.getenv('RABBITMQ_HOST', 'localhost')

# Esperar hasta que RabbitMQ esté disponible
while True:
    try:
        connection = pika.BlockingConnection(pika.ConnectionParameters(rabbitmq_host))
        break
    except pika.exceptions.AMQPConnectionError:
        print("Esperando a que RabbitMQ esté disponible...")
        time.sleep(2)  # Espera 1 segundo antes de intentar nuevamente

channel = connection.channel()

# Declarar la cola
channel.queue_declare(queue='saludo')

# Función para manejar los mensajes recibidos
def callback(ch, method, properties, body):
    print(f"[x] Recibido {body.decode()}")

# Consumir los mensajes de la cola
channel.basic_consume(queue='saludo', on_message_callback=callback, auto_ack=True)

print("[*] Esperando mensajes. Presiona CTRL+C para salir")
channel.start_consuming()
