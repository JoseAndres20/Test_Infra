#!/bin/sh
# Arranca SSH y nginx via systemd

# Validar .env
if [ ! -f /var/www/html/.env.example ]; then
    echo "[ERROR] Archivo .env no encontrado. No se puede iniciar."
    exit 1
fi

if ! grep -q "^prueba=" /var/www/html/.env.example; then
    echo "[ERROR] Falta la variable 'prueba' en .env."
    exit 1
fi

# Preparar directorios necesarios para systemd
mkdir -p /run/systemd/system
mkdir -p /run/sshd

# Iniciar systemd como PID 1
exec /usr/bin/systemd
