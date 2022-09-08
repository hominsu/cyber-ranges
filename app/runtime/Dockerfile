FROM ubuntu:trusty

# image info
ARG AUTHOR_NAME
ARG AUTHOR_EMAIL
# label
LABEL author=${AUTHOR_NAME} email=${AUTHOR_EMAIL}

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive TZ=Asia/Shanghai apt-get install -y --no-install-recommends \
    mysql-server apache2 php5 libapache2-mod-php5 php5-mysql && \
    rm -rf /var/lib/apt/lists/* && \
    echo "ServerName localhost" >> /etc/apache2/apache2.conf && \
    hash -r

# https://httpd.apache.org/docs/2.4/stopping.html#gracefulstop
STOPSIGNAL SIGWINCH

COPY foreground.sh /usr/local/bin/

EXPOSE 80
CMD ["foreground.sh"]