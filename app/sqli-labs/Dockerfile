FROM alpine:latest as tarball

ARG PREFIX=/sqli-labs

RUN apk update && \
    apk add --no-cache ca-certificates curl && \
    mkdir ${PREFIX} && cd ${PREFIX} && \
    curl -sL https://github.com/Audi-1/sqli-labs/tarball/master | \
    tar -zx --strip-components=1 && \
    hash -r

FROM ubuntu:trusty
# image info
ARG AUTHOR_NAME
ARG AUTHOR_EMAIL

# label
LABEL author=${AUTHOR_NAME} email=${AUTHOR_EMAIL}

ARG PREFIX=/var/www/html
ARG DIR=sqli-labs

COPY --from=tarball /sqli-labs ${PREFIX}/${DIR}

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive TZ=Asia/Shanghai apt-get install -y --no-install-recommends \
    mysql-server apache2 php5 libapache2-mod-php5 php5-mysql && \
    rm -rf /var/lib/apt/lists/* && \
    cd ${PREFIX}/${DIR} && \
    sed "s/\$dbuser ='root';/\$dbuser ='$(cat /etc/mysql/debian.cnf | grep user | awk 'NR==1{print $3}')';/g" -i sql-connections/db-creds.inc && \
    sed "s/\$dbpass ='';/\$dbpass ='$(cat /etc/mysql/debian.cnf | grep password | awk 'NR==1{print $3}')';/g" -i sql-connections/db-creds.inc && \
    echo "ServerName localhost" >> /etc/apache2/apache2.conf && \
    hash -r

# https://httpd.apache.org/docs/2.4/stopping.html#gracefulstop
STOPSIGNAL SIGWINCH

COPY utils/foreground.sh /usr/local/bin/

EXPOSE 80
CMD ["foreground.sh"]