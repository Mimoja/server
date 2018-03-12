FROM debian:stretch

ENV LANG C.UTF-8

RUN apt update
RUN apt install -y gnupg2
RUN echo 'deb http://ppa.launchpad.net/hvr/ghc/ubuntu trusty main' > /etc/apt/sources.list.d/ghc.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F6F88286
RUN apt update
RUN apt dist-upgrade -y
RUN apt install -y --no-install-recommends cabal-install-2.0 ghc-8.2.1 happy-1.19.5 alex-3.1.7 \
            zlib1g-dev libtinfo-dev libsqlite3-0 libsqlite3-dev ca-certificates g++ git curl haskell-stack
RUN apt clean -y
RUN curl -fSL https://github.com/commercialhaskell/stack/releases/download/v1.6.5/stack-1.6.5-linux-x86_64-static.tar.gz -o stack.tar.gz
RUN curl -fSL https://github.com/commercialhaskell/stack/releases/download/v1.6.5/stack-1.6.5-linux-x86_64-static.tar.gz.asc -o stack.tar.gz.asc
RUN apt-get purge -y --auto-remove curl
RUN export GNUPGHOME="$(mktemp -d)"
RUN gpg --keyserver keyserver.ubuntu.com --recv-keys C5705533DA4F78D8664B5DC0575159689BEFB442
RUN gpg --batch --verify stack.tar.gz.asc stack.tar.gz
RUN tar -xf stack.tar.gz -C /usr/local/bin --strip-components=1
RUN /usr/local/bin/stack config set system-ghc --global true
RUN rm -rf "$GNUPGHOME" /var/lib/apt/lists/* /stack.tar.gz.asc /stack.tar.gz

RUN stack upgrade

ENV PATH /root/.cabal/bin:/root/.local/bin:/opt/cabal/2.0/bin:/opt/ghc/8.2.1/bin:/opt/happy/1.19.5/bin:/opt/alex/3.1.7/bin:$PATH

RUN git clone http://github.com/simonmichael/hledger hledger
WORKDIR hledger

RUN stack install
RUN /hledger/bin/compile.sh

RUN mkdir /data

EXPOSE 5000

CMD [ "hledger-web", "--serve","--file","/data/hledger.journal", "--host", "0.0.0.0", "--base-url",""]
