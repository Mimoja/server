FROM node:8-stretch
MAINTAINER Mimoja <git@mimoja.de>

RUN apt update
RUN apt dist-upgrade -y
RUN apt install -y texlive-base pandoc curl apt-transport-https

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" >> /etc/apt/sources.list.d/yarn.list
RUN apt update
RUN apt install -y yarn

WORKDIR /opt
RUN git clone https://github.com/benweet/stackedit
WORKDIR stackedit

RUN yarn add gulp gulp-concat
RUN yarn install --production=false
RUN npm install --unsafe-perm

RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*
RUN yarn cache clean
RUN npm cache clean --force

ENV NODE_ENV production
#RUN npm run build

EXPOSE 8080

#CMD [ "node", "." ]
