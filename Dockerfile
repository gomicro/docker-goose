FROM alpine:3.6
MAINTAINER Daniel Hess <dan9186@gmail.com>

RUN apk update && \
    apk upgrade && \
    apk add bash && \
    rm -rf /var/cache/apk/*

ADD https://github.com/pressly/goose/releases/download/v1.0/goose-linux64 /bin/goose
RUN chmod +x /bin/goose

WORKDIR /migrations
