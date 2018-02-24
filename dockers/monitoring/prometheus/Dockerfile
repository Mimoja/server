FROM golang:stretch
MAINTAINER Mimoja <git@mimoja.de>

RUN apt update
RUN apt -y --no-install-recommends install git make
RUN apt dist-upgrade -y
RUN apt clean -y

RUN mkdir -p $GOPATH/src/github.com/prometheus
WORKDIR $GOPATH/src/github.com/prometheus
RUN git clone https://github.com/prometheus/prometheus.git
WORKDIR prometheus
RUN make build

EXPOSE     9090
VOLUME     [ "/prometheus" ]

ENTRYPOINT [ "./prometheus" ]
CMD        [ "--config.file=/etc/prometheus/prometheus.yml", \
             "--storage.tsdb.path=/prometheus", \
             "--web.console.libraries=/usr/share/prometheus/console_libraries", \
"--web.console.templates=/usr/share/prometheus/consoles" ]
