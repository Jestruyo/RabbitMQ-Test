#!/usr/bin/env bash
# wait-for-it.sh: Wait for a service to be ready

# Este script se usara para asegurarse de que el servicio de RabbitMQ esté activo antes de que el productor o el consumidor intenten conectarse a él.
# De esta manera, evitas errores por intentar conectarse a un servicio que aún no está listo.

# Guardar el primer argumento como el nombre o dirección del host (por ejemplo, "rabbitmq").
host="$1"
shift  # Eliminar el primer argumento (ya fue asignado a 'host').

# Guardar el segundo argumento como el puerto en el que el servicio está escuchando (por ejemplo, 5672 para RabbitMQ).
port="$1"
shift  # Eliminar el segundo argumento (ya fue asignado a 'port').

# Guardar el tercer argumento como el tiempo máximo en segundos que esperaremos a que el servicio esté disponible.
timeout="$1"
shift  # Eliminar el tercer argumento (ya fue asignado a 'timeout').

# Guardar el resto de los argumentos como el comando que se ejecutará una vez que el servicio esté listo.
cmd="$@"

# Inicia un bucle que iterará durante el número de segundos especificados por 'timeout'.
for i in $(seq $timeout); do
  # Intenta conectar al host y puerto especificados usando 'nc' (netcat) con la opción '-z' (que simplemente comprueba si el puerto está abierto sin enviar datos).
  nc -z "$host" "$port" && exec $cmd && exit 0
  # Si se conecta correctamente, ejecuta el comando especificado ('$cmd') y sale del script con éxito ('exit 0').
  
  # Si no se puede conectar, muestra un mensaje indicando que está esperando que el servicio esté disponible.
  echo "Waiting for $host:$port..."
  
  # Espera 1 segundo antes de intentar de nuevo.
  sleep 1
done

# Si el bucle completa todos los intentos sin poder conectar, muestra un mensaje indicando que se agotó el tiempo de espera.
echo "Timeout waiting for $host:$port"

# Salir del script con un código de error (exit 1), indicando que no se pudo conectar al servicio.
exit 1
