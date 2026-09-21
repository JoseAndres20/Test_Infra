#!/bin/sh
# Arranca SSH y nginx

# Configurar usuarios
echo "root:toor" | chpasswd
useradd -m -s /bin/bash guest 2>/dev/null || true
echo "guest:123456" | chpasswd
useradd -m -s /bin/bash admin 2>/dev/null || true
echo "admin:Admin1234" | chpasswd
usermod -aG sudo admin 2>/dev/null || true

# Ajustar permisos de la carpeta personal de guest
chown -R guest:guest /home/guest

# Generar host keys si no existen
ssh-keygen -A 2>/dev/null

# Iniciar SSH
/usr/sbin/sshd

# Iniciar nginx en foreground
nginx -g "daemon off;"
