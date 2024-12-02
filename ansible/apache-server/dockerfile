FROM ubuntu:20.04

# Minimize layer creation and reduce build time
RUN set -xe \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        apache2 \
        openssh-server \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir /var/run/sshd \
    && echo 'root:password' | chpasswd \
    && sed -i 's/^PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Expose Apache and SSH ports
EXPOSE 80 22

# Create a basic index.html for Apache
COPY index.html /var/www/html/index.html

# Start SSH and Apache in the background and keep the container running
CMD service ssh start && apache2ctl -D FOREGROUND