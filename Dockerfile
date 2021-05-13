FROM ubuntu:20.04

LABEL maintainer="Mia Barbir"

RUN apt-get update \
 && apt-get install -y \
    zsh \
    wget \
    git \
    npm \
    vim \
    tmux \
    python3 \
    python3-pip \
 && rm -rf /var/lib/apt/lists/*

 