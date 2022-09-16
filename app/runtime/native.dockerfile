# syntax=docker/dockerfile:1.4

FROM ubuntu:trusty

# image info
ARG AUTHOR_NAME
ARG AUTHOR_EMAIL
# label
LABEL author=${AUTHOR_NAME} email=${AUTHOR_EMAIL}

RUN set -eux; \
    apt-get update; \
    DEBIAN_FRONTEND=noninteractive TZ=Asia/Shanghai apt-get install -y --no-install-recommends \
    apache2 php5 libapache2-mod-php5 php5-gd; \
    rm -rf /var/lib/apt/lists/*; \
    sed "s/;mbstring./mbstring./g" -i /etc/php5/apache2/php.ini; \
    sed "s/;gd./gd./g" -i /etc/php5/apache2/php.ini; \
    sed "s/;exif./exif./g" -i /etc/php5/apache2/php.ini; \
    echo "ServerName localhost" >> /etc/apache2/apache2.conf

# https://httpd.apache.org/docs/2.4/stopping.html#gracefulstop
STOPSIGNAL SIGWINCH

COPY --from=utils /apache-foreground.sh /usr/local/bin/

EXPOSE 80
CMD ["apache-foreground.sh"]