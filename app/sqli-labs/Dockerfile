# syntax=docker/dockerfile:1.4

# fetch tarball
FROM alpine:latest as tarball

ARG PREFIX=/sqli-labs

RUN apk update && \
    apk add --no-cache ca-certificates curl && \
    mkdir ${PREFIX} && cd ${PREFIX} && \
    curl -sL https://github.com/Audi-1/sqli-labs/tarball/master | \
    tar -zx --strip-components=1 && \
    hash -r

# sqli-labs
FROM hominsu/cyber-ranges:runtime

# image info
ARG AUTHOR_NAME
ARG AUTHOR_EMAIL

# label
LABEL author=${AUTHOR_NAME} email=${AUTHOR_EMAIL}

ARG PREFIX=/var/www/html
ARG DIR=sqli-labs

COPY --from=tarball /sqli-labs ${PREFIX}/${DIR}

RUN cd ${PREFIX}/${DIR} && \
    sed "s/\$dbuser ='root';/\$dbuser ='$(cat /etc/mysql/debian.cnf | grep user | awk 'NR==1{print $3}')';/g" -i sql-connections/db-creds.inc && \
    sed "s/\$dbpass ='';/\$dbpass ='$(cat /etc/mysql/debian.cnf | grep password | awk 'NR==1{print $3}')';/g" -i sql-connections/db-creds.inc && \
    hash -r