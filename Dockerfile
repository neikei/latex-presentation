FROM debian:buster

LABEL maintainer="neikei"
LABEL version="1.1"

ENV DEBIAN_FRONTEND noninteractive

VOLUME ["/data"]

RUN apt update -q && apt install -qy --no-install-recommends \
    texlive-full \
    texlive-latex-extra \
    texlive-fonts-extra \
    fonts-firacode \
    wget \
    latexmk \
    python3-pygments \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /data
