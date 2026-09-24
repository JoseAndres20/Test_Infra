FROM debian:12-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    openssh-server \
    nginx \
    sudo \
    systemd \
    nano \
    vim-tiny \
    && rm -rf /var/lib/apt/lists/*

# Banner SSH y archivos del sistema
COPY banner.txt /etc/ssh/banner.txt
COPY guest_files/ /home/guest/

# Configurar SSH: permitir root + password + mostrar banner
RUN mkdir -p /var/run/sshd && \
    sed -i 's/#PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication.*/PasswordAuthentication yes/' /etc/ssh/sshd_config && \
    echo "Banner /etc/ssh/banner.txt" >> /etc/ssh/sshd_config

# Configurar usuarios
RUN echo "root:toor" | chpasswd && \
    useradd -m -s /bin/bash guest 2>/dev/null && \
    echo "guest:123456" | chpasswd && \
    usermod -aG sudo guest && \
    useradd -m -s /bin/bash admin 2>/dev/null && \
    echo "admin:Admin1234" | chpasswd && \
    usermod -aG sudo admin && \
    useradd -m -s /bin/bash guest22 2>/dev/null && \
    echo "guest22:Password123!" | chpasswd && \
    echo "guest22 ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/guest22 && \
    chmod 440 /etc/sudoers.d/guest22 && \
    useradd -m -s /bin/bash guest23 2>/dev/null && \
    echo "guest23:Password123!" | chpasswd && \
    echo "guest23 ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/guest23 && \
    chmod 440 /etc/sudoers.d/guest23 && \
    chown -R guest:guest /home/guest

# Web
COPY web/index.html /var/www/html/index.html
COPY web/.env /var/www/html/.env

# Habilitar servicios con systemd
RUN mkdir -p /etc/systemd/system/multi-user.target.wants && \
    ln -sf /lib/systemd/system/nginx.service /etc/systemd/system/multi-user.target.wants/nginx.service && \
    ln -sf /lib/systemd/system/ssh.service /etc/systemd/system/multi-user.target.wants/ssh.service

# Entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 22 80

ENTRYPOINT ["/entrypoint.sh"]
