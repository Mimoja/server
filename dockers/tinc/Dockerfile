FROM alpine:latest
MAINTAINER Mimoja <git@mimoja.de>

RUN apk update
RUN apk add --update tinc-pre bash
RUN rm -rf /var/cache/apk/*

EXPOSE 655/tcp 655/udp

CMD ["/usr/sbin/tincd", "-D", "-n", "Mimoja", "-d3" ]
