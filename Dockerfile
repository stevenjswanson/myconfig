
FROM ubuntu

# prevent Debian's PHP packages from being installed
# https://github.com/docker-library/php/pull/542
RUN set -eux; \
    { \
        echo 'Package: php*'; \
        echo 'Pin: release *'; \
        echo 'Pin-Priority: -1'; \
    } > /etc/apt/preferences.d/no-debian-php


RUN apt-get update; apt-get install -y gcc git emacs make g++ python less build-essential gdb vim curl python3-pip python3.6 python3 googletest cmake libpng-dev

RUN apt-get install -y python-pip python
RUN apt-get install -y  man-db  manpages-dev  manpages-posix-dev
RUN pip install --upgrade pip
RUN pip install virtualenv
RUN pip3 install --upgrade pip
RUN pip3 install --upgrade virtualenv

# add new things here to make rebuilds faster
RUN  apt-get install -y libjpeg-dev unzip	

VOLUME /Users/swanson
WORKDIR /Users/swanson
ENV HOME /Users/swanson

RUN bash 