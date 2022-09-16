# syntax=docker/dockerfile:1.4

# fetch tarball
FROM hominsu/cyber-ranges:runtime-tarball as tarball

ARG PREFIX=/upload-labs

RUN set -eux; \
    mkdir ${PREFIX}; \
    cd ${PREFIX}; \
    curl -sL https://github.com/c0ny1/upload-labs/tarball/master | \
    tar -zx --strip-components=1

# upload-labs
FROM hominsu/cyber-ranges:runtime-native
# image info
ARG AUTHOR_NAME
ARG AUTHOR_EMAIL

# label
LABEL author=${AUTHOR_NAME} email=${AUTHOR_EMAIL}

ARG PREFIX=/var/www/html
ARG DIR=upload-labs

COPY --from=tarball /upload-labs ${PREFIX}/${DIR}
