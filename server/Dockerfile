FROM debian:12-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    openssh-server \
    nginx \
    && rm -rf /var/lib/apt/lists/*

# Banner SSH
COPY banner.txt /etc/ssh/banner.txt

# Configurar SSH: permitir root + password + mostrar banner
RUN mkdir -p /var/run/sshd && \
    sed -i 's/#PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication.*/PasswordAuthentication yes/' /etc/ssh/sshd_config && \
    echo "Banner /etc/ssh/banner.txt" >> /etc/ssh/sshd_config

# Web
COPY web/index.html /var/www/html/index.html

# Entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 22 80

ENTRYPOINT ["/entrypoint.sh"]
