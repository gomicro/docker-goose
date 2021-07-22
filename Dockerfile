FROM alpine:3.14.0
MAINTAINER Gomicro Dev <dev@gomicro.io>

RUN apk update && \
    apk upgrade && \
    apk add bash && \
    rm -rf /var/cache/apk/*

ADD https://github.com/pressly/goose/releases/download/v2.6.0/goose-linux64 /bin/goose
RUN chmod +x /bin/goose

WORKDIR /migrations
