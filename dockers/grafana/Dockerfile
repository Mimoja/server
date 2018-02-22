FROM debian:stretch

MAINTAINER Mimoja <git@mimoja.de>

RUN apt update
RUN apt -y --no-install-recommends install libfontconfig wget ca-certificates
RUN apt dist-upgrade -y
RUN apt clean -y

VOLUME ["/var/lib/grafana", "/var/log/grafana", "/etc/grafana"]

RUN wget "https://s3-us-west-2.amazonaws.com/grafana-releases/master/grafana_latest_amd64.deb" 

RUN dpkg -i grafana_latest_amd64.deb
RUN rm -rf /var/lib/grafana/.init

EXPOSE 3000
