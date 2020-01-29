FROM debian:buster

LABEL maintainer="neikei"
LABEL version="1.0"

ENV DEBIAN_FRONTEND noninteractive

RUN apt update -q && apt install -qy \
    texlive-full \
    texlive-fonts-extra \
    fonts-firacode \
    wget \
    && rm -rf /var/lib/apt/lists/*

RUN tlmgr init-usertree
RUN tlmgr option repository ftp://tug.org/historic/systems/texlive/2018/tlnet-final
RUN tlmgr install minted
RUN tlmgr update --all

WORKDIR /data
VOLUME ["/data"]