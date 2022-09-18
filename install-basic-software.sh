#!/bin/bash

echo "###"
echo "### install-basic-software.sh ###"
id
echo "###"

DEBIAN_FRONTEND=noninteractive apt-get -yq update

echo "> command: ntpdate"
DEBIAN_FRONTEND=noninteractive apt-get -yq install ntpdate
ntpdate-debian

echo "> command: gcc"
DEBIAN_FRONTEND=noninteractive apt-get -yq install gcc

echo "> command: build-essential"
DEBIAN_FRONTEND=noninteractive apt-get -yq install build-essential

echo "> command: make"
DEBIAN_FRONTEND=noninteractive apt-get -yq install make

echo "> command: perl"
DEBIAN_FRONTEND=noninteractive apt-get -yq install perl

echo "> command: finger"
DEBIAN_FRONTEND=noninteractive apt-get -yq install finger

echo "> Install: uidmap"
DEBIAN_FRONTEND=noninteractive apt-get -yq install uidmap

echo "> Install: dbus-user-session"
DEBIAN_FRONTEND=noninteractive apt-get -yq install dbus-user-session

echo "> Install: net-tools"
DEBIAN_FRONTEND=noninteractive apt-get -yq install net-tools

echo "> command: openssh-server"
DEBIAN_FRONTEND=noninteractive apt-get -yq install openssh-server
ufw allow ssh
systemctl status ssh
