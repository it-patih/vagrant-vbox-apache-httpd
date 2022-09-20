#!/bin/bash

echo "###"
echo "### install-basic-software.sh ###"
echo "### packages sources: https://packages.ubuntu.com ###"
id
echo "###"

DEBIAN_FRONTEND=noninteractive apt-get -yq update

echo "> command: ntpdate"
DEBIAN_FRONTEND=noninteractive apt-get -yq install ntpdate
ntpdate-debian

echo "> Install: uidmap"
DEBIAN_FRONTEND=noninteractive apt-get -yq install uidmap

echo "> Install: dbus-user-session"
DEBIAN_FRONTEND=noninteractive apt-get -yq install dbus-user-session

echo "> command: finger"
DEBIAN_FRONTEND=noninteractive apt-get -yq install finger

echo "> Install: net-tools"
DEBIAN_FRONTEND=noninteractive apt-get -yq install net-tools

echo "> command: openssh-server"
DEBIAN_FRONTEND=noninteractive apt-get -yq install openssh-server
ufw allow ssh
systemctl status ssh

echo "> command: build-essential"
DEBIAN_FRONTEND=noninteractive apt-get -yq install build-essential

echo "> command: autoconf"
DEBIAN_FRONTEND=noninteractive apt-get -yq install autoconf

echo "> command: libtool"
DEBIAN_FRONTEND=noninteractive apt-get -yq install libtool

echo "> command: libssl-dev"
DEBIAN_FRONTEND=noninteractive apt-get -yq install libssl-dev

echo "> command: libcurl4-openssl-dev"
DEBIAN_FRONTEND=noninteractive apt-get -yq install libcurl4-openssl-dev

echo "> command: libxml2-dev"
DEBIAN_FRONTEND=noninteractive apt-get -yq install libxml2-dev

echo "> command: libreadline-dev"
DEBIAN_FRONTEND=noninteractive apt-get -yq install libreadline-dev

echo "> command: libzip-dev"
DEBIAN_FRONTEND=noninteractive apt-get -yq install libzip-dev

echo "> command: libpng-dev"
DEBIAN_FRONTEND=noninteractive apt-get -yq install libpng-dev

echo "> command: libavif-dev"
DEBIAN_FRONTEND=noninteractive apt-get -yq install libavif-dev

echo "> command: libwebp-dev"
DEBIAN_FRONTEND=noninteractive apt-get -yq install libwebp-dev

echo "> command: libjpeg-dev"
DEBIAN_FRONTEND=noninteractive apt-get -yq install libjpeg-dev

echo "> command: libxpm-dev"
DEBIAN_FRONTEND=noninteractive apt-get -yq install libxpm-dev

echo "> command: libfreetype-dev"
DEBIAN_FRONTEND=noninteractive apt-get -yq install libfreetype-dev

echo "> command: pkg-config"
DEBIAN_FRONTEND=noninteractive apt-get -yq install pkg-config

echo "> command: bison"
DEBIAN_FRONTEND=noninteractive apt-get -yq install bison

echo "> command: re2c"
DEBIAN_FRONTEND=noninteractive apt-get -yq install re2c

echo "> command: libsqlite3-dev"
DEBIAN_FRONTEND=noninteractive apt-get -yq install libsqlite3-dev

echo "> command: libonig-dev"
DEBIAN_FRONTEND=noninteractive apt-get -yq install libonig-dev

