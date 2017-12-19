FROM node:6
MAINTAINER Mimoja <git@mimoja.de>

ENV NODE_ENV production
ENV THELOUNGE_HOME "/lounge"

RUN apt update
RUN apt dist-upgrade -y
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

RUN npm install -g thelounge@next

RUN mkdir -p "${THELOUNGE_HOME}"

EXPOSE 9000
VOLUME "${THELOUNGE_HOME}"

