#!/bin/bash

echo "###"
echo "### install-basic-software.sh ###"
echo "### packages sources: https://packages.ubuntu.com ###"
echo "> command: id"
id
echo "###"

DEBIAN_FRONTEND=noninteractive apt-get -yq update

echo "> Install: ntpdate"
DEBIAN_FRONTEND=noninteractive apt-get -yq install ntpdate
echo "> command: ntpdate-debian"
ntpdate-debian

echo "> Install: uidmap"
DEBIAN_FRONTEND=noninteractive apt-get -yq install uidmap

echo "> Install: dbus-user-session"
DEBIAN_FRONTEND=noninteractive apt-get -yq install dbus-user-session

echo "> Install: finger"
DEBIAN_FRONTEND=noninteractive apt-get -yq install finger

echo "> Install: net-tools"
DEBIAN_FRONTEND=noninteractive apt-get -yq install net-tools

echo "> Install: openssh-server"
DEBIAN_FRONTEND=noninteractive apt-get -yq install openssh-server
ufw allow ssh
systemctl status ssh

echo "> Install: build-essential"
DEBIAN_FRONTEND=noninteractive apt-get -yq install build-essential

echo "> Install: autoconf"
DEBIAN_FRONTEND=noninteractive apt-get -yq install autoconf

echo "> Install: libtool"
DEBIAN_FRONTEND=noninteractive apt-get -yq install libtool

echo "> Install: libssl-dev"
DEBIAN_FRONTEND=noninteractive apt-get -yq install libssl-dev

echo "> Install: libcurl4-openssl-dev"
DEBIAN_FRONTEND=noninteractive apt-get -yq install libcurl4-openssl-dev

echo "> Install: libxml2-dev"
DEBIAN_FRONTEND=noninteractive apt-get -yq install libxml2-dev

echo "> Install: libreadline-dev"
DEBIAN_FRONTEND=noninteractive apt-get -yq install libreadline-dev

echo "> Install: libzip-dev"
DEBIAN_FRONTEND=noninteractive apt-get -yq install libzip-dev

echo "> Install: libpng-dev"
DEBIAN_FRONTEND=noninteractive apt-get -yq install libpng-dev

echo "> Install: libavif-dev"
DEBIAN_FRONTEND=noninteractive apt-get -yq install libavif-dev

echo "> Install: libwebp-dev"
DEBIAN_FRONTEND=noninteractive apt-get -yq install libwebp-dev

echo "> Install: libjpeg-dev"
DEBIAN_FRONTEND=noninteractive apt-get -yq install libjpeg-dev

echo "> Install: libxpm-dev"
DEBIAN_FRONTEND=noninteractive apt-get -yq install libxpm-dev

echo "> Install: libfreetype-dev"
DEBIAN_FRONTEND=noninteractive apt-get -yq install libfreetype-dev

echo "> Install: pkg-config"
DEBIAN_FRONTEND=noninteractive apt-get -yq install pkg-config

echo "> Install: bison"
DEBIAN_FRONTEND=noninteractive apt-get -yq install bison

echo "> Install: re2c"
DEBIAN_FRONTEND=noninteractive apt-get -yq install re2c

echo "> Install: libsqlite3-dev"
DEBIAN_FRONTEND=noninteractive apt-get -yq install libsqlite3-dev

echo "> Install: libonig-dev"
DEBIAN_FRONTEND=noninteractive apt-get -yq install libonig-dev

