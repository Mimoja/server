FROM ubuntu:latest
MAINTAINER Mimoja <git@mimoja.de>

#use Bash
RUN echo "dash dash/sh boolean false" | debconf-set-selections 
RUN dpkg-reconfigure -p critical dash

#install dependencies
RUN apt update
RUN apt dist-upgrade
RUN apt install -y bc bison bsdmainutils build-essential curl \
        flex g++-multilib gcc-multilib git gnupg gperf lib32ncurses5-dev \
        lib32z1-dev libesd0-dev libncurses5-dev \
        libsdl1.2-dev libwxgtk3.0-dev libxml2-utils lzop sudo \
        openjdk-8-jdk \
        pngcrush schedtool xsltproc zip zlib1g-dev graphviz
RUN apt clean

#install repo tool
ADD https://commondatastorage.googleapis.com/git-repo-downloads/repo /usr/local/bin/
RUN chmod 755 /usr/local/bin/repo


# Add build tool
ADD _aosp.sh /usr/local/bin/aosp
RUN chmod +x /usr/local/bin/aosp

#create user and folder
RUN mkdir /aosp
RUN mkdir /ccache

RUN useradd -d /home/aosp -m aosp
RUN chown -R aosp /home/aosp /ccache /aosp

USER aosp
WORKDIR /aosp

ENV USE_CCACHE=1
ENV CCACHE_DIR=/ccache


