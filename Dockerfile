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

# Set default user
ARG USERNAME="usopp"
ARG USERID="1000"
ARG GROUPID="3000"
RUN groupadd -g $GROUPID -r $USERNAME \
 && useradd --no-log-init -r --gid $GROUPID -u $USERID $USERNAME \
 && mkdir /home/$USERNAME
RUN chown -R ${USERNAME}:${USERNAME} /home/${USERNAME} \
 && chown -R ${USERNAME}:${USERNAME} /usr/local \
 && echo ${USERNAME}:${USERNAME} | chpasswd \
 && chsh -s /usr/bin/zsh ${USERNAME}
USER ${USERNAME}

WORKDIR /home/${USERNAME}

# Install custom terminal configuration 
RUN sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
COPY .zshrc .
COPY .p10k.zsh . 

ENTRYPOINT [ "/usr/bin/zsh" ]