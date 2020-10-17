FROM ubuntu:20.04

LABEL maintainer="Dehaeze Thomas <dehaeze.thomas@gmail.com>"

RUN \
  groupadd -g 1000 appuser && \
  useradd -r -u 1000 -g appuser appuser

RUN \
  echo "**** install runtime packages ****" && \
  apt-get update && \
  apt-get install -y --no-install-recommends \
      neomutt \
      isync \
      msmtp \
      maildir-utils \
      neovim \
      bash \
      ca-certificates \
      ranger \
      fontconfig \
      unzip \
      curl \
      locales \
      gnupg

# RUN \ 
#   echo "**** Install Fonts ****" && \
#   curl -fLo "/tmp/Hack.zip" https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.zip && \
#   unzip /tmp/Hack.zip -d /usr/share/fonts && \
#   fc-cache -fv

RUN \
  echo "**** cleanup ****" && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN locale-gen en_US.UTF-8

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

ENV \
  XDG_DATA_HOME="/config" \
  XDG_CONFIG_HOME="/config" \
  HOME="/config" \
  TERM="xterm-256color" \
  PUID="" \
  PGID=""

USER appuser

# WORKDIR /home/appuser
WORKDIR /

ENTRYPOINT ["/bin/bash"]
