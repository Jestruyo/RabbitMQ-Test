# Bienvenido al proyecto Test RabbitMQ

Este proyecto consiste en levantar 3 contenedores Docker, conectados dentro de la misma red, para su correcto funcionamiento.

## Comando inicial en una terminal
1. `docker-compose up --build`  
   Comando para descargar la imagen requerida, iniciar los contenedores y la red.

## Ingresar al administrador de RabbitMQ web
2. Ingresa a la siguiente URL:  
   [http://localhost:15672/](http://localhost:15672/)  
   Para hacer el respectivo inicio de sesión en el administrador de RabbitMQ.
   - **Usuario:** guest (Por defecto).
   - **Contraseña:** guest (Por defecto).  
   
   Se verá el panel "Overview" y los demás módulos pertinentes del cliente.

## En otra terminal, usa los siguientes comandos para ejecutar `consumer.py`:
3. `docker-compose exec consumer sh`  
   Ingresa dentro del contenedor **consumer**.
4. `ls`  
   Para validar los archivos ejecutables dentro del contenedor, entre ellos `producer.py` y `consumer.py`.
5. `python3 consumer.py`  
   Ejecuta el consumer para esperar la captura de un mensaje de la cola de RabbitMQ.  
   Verás algo como: `[*] Esperando mensajes. Presiona CTRL+C para salir`.

## En otra terminal, usa los siguientes comandos para ejecutar `producer.py`:
6. `docker-compose exec consumer sh`  
   Ingresa dentro del contenedor **consumer**.
7. `ls`  
   Para validar los archivos ejecutables dentro del contenedor, entre ellos `producer.py` y `consumer.py`.
8. `python3 producer.py`  
   Ejecuta el producer para el envío de un mensaje a la cola de RabbitMQ.

## Paso para ver el consumo del mensaje:
9. Vuelve a la terminal donde ejecutaste `consumer.py` y escribe:  
   `python3 consumer.py`
10. Vuelve a la terminal donde ejecutaste `producer.py` y escribe:  
    `python3 producer.py`

## Ahora vuelve a la terminal del consumer y verás el mensaje impreso en la consola.
- [x] Recibido: `b'Hello RabbitMQ from Docker!'`
