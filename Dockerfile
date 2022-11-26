# syntax = docker/dockerfile:1.1.1-experimental
FROM ubuntu:20.04

# If you are in a proxy environment, define the relevant environment variables here.
# ENV http_proxy http://xxx:0000
# ENV https_proxy http://xxx:0000

# Avoid to stop docker build
RUN apt-get update && apt-get -y install tzdata && echo 'Asia/Tokyo' > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata

# See https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html#build-host-packages
RUN apt-get update && apt install -y \
      gawk \
      wget \
      git \
      diffstat \
      unzip \
      texinfo \
      gcc \
      build-essential \
      chrpath \
      socat \
      cpio \
      python3 \
      python3-pip \
      python3-pexpect \
      xz-utils \
      debianutils \
      iputils-ping \
      python3-git \
      python3-jinja2 \
      libegl1-mesa \
      libsdl1.2-dev \
      pylint3 \
      xterm \
      python3-subunit \
      mesa-common-dev \
      zstd \
      liblz4-tool

RUN apt install -y \
      curl \
      language-pack-en \
      vim \
      tree

# Avoid /usr/bin/env: `python`: No such file or directory
RUN ln -s /usr/bin/python3 /usr/bin/python

# Support the en_US.UT-8
RUN update-locale LANG=en_US.UTF-8

# Add a user for build
RUN groupadd -g 1000 builduser && useradd --create-home --shell /bin/bash --uid 1000 --gid 1000 builduser
USER builduser
WORKDIR /home/builduser/

# Install repo
RUN mkdir ~/bin && curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo && chmod a+x ~/bin/repo

RUN git config --global user.email "" && git config --global user.name ""
