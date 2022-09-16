# syntax=docker/dockerfile:1.4

# fetch tarball
FROM hominsu/cyber-ranges:runtime-tarball as tarball

ARG PREFIX=/sqli-labs

RUN set -eux; \
    mkdir ${PREFIX}; \
    cd ${PREFIX}; \
    curl -sL https://github.com/Audi-1/sqli-labs/tarball/master | \
    tar -zx --strip-components=1

# sqli-labs
FROM hominsu/cyber-ranges:runtime-mysql
# image info
ARG AUTHOR_NAME
ARG AUTHOR_EMAIL

# label
LABEL author=${AUTHOR_NAME} email=${AUTHOR_EMAIL}

ARG PREFIX=/var/www/html
ARG DIR=sqli-labs

COPY --from=tarball /sqli-labs ${PREFIX}/${DIR}

RUN set -eux; \
    cd ${PREFIX}/${DIR}; \
    sed "s/\$dbuser ='root';/\$dbuser ='$(cat /etc/mysql/debian.cnf | grep user | awk 'NR==1{print $3}')';/g" -i sql-connections/db-creds.inc; \
    sed "s/\$dbpass ='';/\$dbpass ='$(cat /etc/mysql/debian.cnf | grep password | awk 'NR==1{print $3}')';/g" -i sql-connections/db-creds.inc
