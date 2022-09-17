# syntax=docker/dockerfile:1.4

# fetch tarball
FROM hominsu/cyber-ranges:runtime-tarball as tarball

ARG PREFIX=/xxe-lab

RUN set -eux; \
    mkdir ${PREFIX}; \
    cd ${PREFIX}; \
    curl -sL https://github.com/c0ny1/xxe-lab/tarball/master | \
    tar -zx --strip-components=1

# xxe-lab/php_xxe
FROM hominsu/cyber-ranges:runtime-native
# image info
ARG AUTHOR_NAME
ARG AUTHOR_EMAIL

# label
LABEL author=${AUTHOR_NAME} email=${AUTHOR_EMAIL}

ARG PREFIX=/var/www/html
ARG DIR=xxe-lab/php_xxe

COPY --from=tarball /xxe-lab/php_xxe ${PREFIX}/${DIR}
