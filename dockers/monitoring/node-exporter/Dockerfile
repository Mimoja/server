FROM golang:stretch
MAINTAINER Mimoja <git@mimoja.de>

RUN apt update
RUN apt -y --no-install-recommends install git make wget
RUN apt dist-upgrade -y
RUN apt clean -y

#RUN go get github.com/prometheus/node_exporter
#WORKDIR  ${GOPATH}/src/github.com/prometheus/node_exporter
#RUN make

RUN mkdir -p $GOPATH/src/github.com/prometheus
WORKDIR $GOPATH/src/github.com/prometheus
RUN git clone https://github.com/prometheus/node_exporter.git -b release-0.15
WORKDIR node_exporter
RUN make

EXPOSE     9100

RUN mkdir -p /host/proc /host/sys

USER nobody
ENTRYPOINT [ "./node_exporter" ]
CMD ["--no-collector.timex" , "--path.procfs=/host/proc", "--path.sysfs=/host/sys","--collector.filesystem.ignored-mount-points='^/(sys|host|proc|dev|etc)($|/)'"]
