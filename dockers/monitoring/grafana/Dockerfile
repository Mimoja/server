FROM debian:stretch

MAINTAINER Mimoja <git@mimoja.de>

RUN apt update
RUN apt -y --no-install-recommends install libfontconfig wget ca-certificates
RUN apt dist-upgrade -y
RUN apt clean -y


RUN wget "https://s3-us-west-2.amazonaws.com/grafana-releases/master/grafana_latest_amd64.deb" 
RUN dpkg -i grafana_latest_amd64.deb

RUN rm -rf /var/lib/grafana/*
RUN rm -rf /var/log/grafana/*
RUN rm -rf /etc/grafana/*

VOLUME /var/lib/grafana
VOLUME /var/log/grafana
VOLUME /etc/grafana

EXPOSE 3000

ENTRYPOINT grafana-server
CMD --config=/etc/grafana/grafana.ini -homepath /usr/share/grafana/ cfg:default.paths.provisioning=/etc/grafana/provisioning cfg:default.paths.data=/var/lib/grafana cfg:default.paths.logs=/var/log/grafana cfg:default.paths.plugins=/var/lib/grafana/plugins

