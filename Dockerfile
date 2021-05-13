FROM ubuntu:20.04

LABEL maintainer="Mia Barbir"

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
 && apt-get install -y \
    zsh \
    wget \
    git \
    npm \
    vim \
    python3 \
    python3-pip \
 && rm -rf /var/lib/apt/lists/*

#Install custom environment 
RUN sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" 