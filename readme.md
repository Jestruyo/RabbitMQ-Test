# Bienvenido al proyecto test rabbitMq
Este proyecto consiste en lavantar 3 contenedores docker, apuntando dentro de la misma red, para su correcto funcionamiento.

# Comando inicial en una terminal
 - 1) docker-compose up --build | -> Comando para descargar la imagen requerida, iniciar los contenedores y la red.

# Ingresar al admin de rabbitMQ web
 - 2)  http://localhost:15672/ | -> Ingresa a la url anterior, para hacer el respectivo logueo en el administrador de RabbitMQ.
 - Usuario: guest -> Por defecto.
 - Password: guest -> Por defecto.
 Se vera el Overview y los demas modulos pertinentes del cliente.

# En otra terminal usa los siguientes comandos para ejecutar el consumer.py
 - 3) docker-compose exec consumer sh -> Ingresa dentro del contenedor consumer
 - 4) ls -> para validar los archivos ejecutables dentro del contenedor, entre ellos producer.py y consumer.py
 - 5) python3 consumer.py -> Ejecuta el consumer para la espera de capturar un mensaje de la cola de rabbitMq
 -    Veras algo asi: [*] Esperando mensajes. Presiona CTRL+C para salir.

# En otra terminal usa los siguientes comandos para ejecutar el producer.py
 - 6) docker-compose exec consumer sh -> Ingresa dentro del contenedor consumer
 - 7) ls -> para validar los archivos ejecutables dentro del contenedor, entre ellos producer.py y consumer.py
 - 8) python3 producer.py -> Ejecuta el producer para el envio de un mensaje a la cola de rabbitMq.

# Paso para ver el consumo del mensaje
 - 9) Vuelve a la terminal donde ejecutaste el consumer.py, y escribe: python3 consumer.py
 - 10) Vuelve a la terminal donde ejecutaste el producer.py, y escribe: python3 producer.py

 ## Ahora vuelve a la terminal del consumer y veras el mensaje impreso en la consola.
 - [x] Recibido b'Hello RabbitMQ from Docker!'
