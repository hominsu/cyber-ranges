# syntax=docker/dockerfile:1.4

# fetch tarball
FROM hominsu/cyber-ranges:runtime-tarball as tarball

ARG PREFIX=/pikachu

RUN set -eux; \
    mkdir ${PREFIX}; \
    cd ${PREFIX}; \
    curl -sL https://github.com/zhuifengshaonianhanlu/pikachu/tarball/master | \
    tar -zx --strip-components=1

# pikachu
FROM hominsu/cyber-ranges:runtime-mysql
# image info
ARG AUTHOR_NAME
ARG AUTHOR_EMAIL

# label
LABEL author=${AUTHOR_NAME} email=${AUTHOR_EMAIL}

ARG PREFIX=/var/www/html
ARG DIR=pikachu

COPY --from=tarball /pikachu ${PREFIX}/${DIR}

RUN set -eux; \
    cd ${PREFIX}/${DIR}; \
    sed "s/define('DBUSER', 'root');/\define('DBUSER', '$(cat /etc/mysql/debian.cnf | grep user | awk 'NR==1{print $3}')');/g" -i inc/config.inc.php; \
    sed "s/define('DBPW', '');/define('DBPW', '$(cat /etc/mysql/debian.cnf | grep password | awk 'NR==1{print $3}')');/g" -i inc/config.inc.php
