FROM alpine:latest

ARG version=27.1
ENV GIT_USER=Tesao
ENV GIT_EMAIL=

RUN apk update \
    && apk upgrade \
    && apk add curl gzip git ncurses-dev gnutls-dev --no-cache \
    && apk add --virtual emacs-build-tools gcc make alpine-sdk --no-cache \
    && mkdir /emacs \
    && cd /emacs \
    # get emacs zip
    && curl -o emacs.tar.gz https://mirror.us-midwest-1.nexcess.net/gnu/emacs/emacs-$version.tar.gz \
    && tar -vxf emacs.tar.gz \
    && cd emacs-$version \
    # build emacs
    && ./configure CFLAGS=-O3 --with-gnutls=yes --without-pop \
    && make \
    && make install \
    && apk del emacs-build-tools \
    && cp src/emacs /usr/local/bin

WORKDIR /work
VOLUME ["/work"]

COPY init.el /root/.emacs.d/init.el

ENTRYPOINT emacs .
