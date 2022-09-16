# syntax=docker/dockerfile:1.4

FROM hominsu/cyber-ranges:runtime-native

# image info
ARG AUTHOR_NAME
ARG AUTHOR_EMAIL
# label
LABEL author=${AUTHOR_NAME} email=${AUTHOR_EMAIL}

RUN set -eux; \
    apt-get update; \
    DEBIAN_FRONTEND=noninteractive TZ=Asia/Shanghai apt-get install -y --no-install-recommends \
    mysql-server php5-mysql; \
    rm -rf /var/lib/apt/lists/*

# https://httpd.apache.org/docs/2.4/stopping.html#gracefulstop
STOPSIGNAL SIGWINCH

COPY --from=utils /foreground.sh /usr/local/bin/

EXPOSE 80
CMD ["foreground.sh"]