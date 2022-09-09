FROM alpine:latest

RUN apk update && \
    apk add --no-cache ca-certificates curl && \
    hash -r
