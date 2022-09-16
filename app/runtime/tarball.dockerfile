FROM alpine:latest

RUN set -eux; \
    apk update; \
    apk add --no-cache ca-certificates curl
