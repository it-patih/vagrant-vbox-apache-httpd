#!/bin/bash

echo "###"
echo "### configure-user-access.sh ### "
id
echo "###"

NOW=$(date +"%Y%m%d-%H%M%S")

echo "> Backup /home/vagrant/.ssh/authorized_keys"
cp /home/vagrant/.ssh/authorized_keys /home/vagrant/.ssh/authorized_keys.$NOW

echo "> Add public key of operator to login to user vagrant"
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCc/JpeqhJWZIPjqakdjLu2PcuS/aEV8RYHeJj+R4q+nIHYNVMiC8f7y2oeWSgHebrUFqoRG9Le0GNf0TXtSIafjNPNCvOvLhZX+ghNozFJ47OUfjeGGv26al+bF2tzS9ETqmmFI7gTTGrP5j+D9BG3k6RMrWHSU+3oSFJxnthMeCqa7SWPxmLZ94cUF3HYhXE8P/Bfw7bkyMY8SC1zA9o2vag2qdoKFJN3LE4KxRX3MTG6H4gfVy5z8o+4taF3W/hspcmRxOUN7YDwh+Q2CPDLDkqXheqQePXaGAdqmwf0atdI4hjA7kvqcQeGIgRRg36luUVonivJc3Ht7wnlup/t operator" >> /home/vagrant/.ssh/authorized_keys

echo "> Create and configure new user apache"
sudo useradd -m -s /bin/bash apache
ssh-keygen -q -t rsa -N '' -f /home/vagrant/.ssh/id_rsa
sudo mkdir /home/apache/.ssh
sudo chown apache:apache /home/apache/.ssh
sudo cp /home/vagrant/.ssh/id_rsa.pub /home/apache/.ssh/authorized_keys
sudo chown apache:apache /home/apache/.ssh/authorized_keys
#usermod -aG sudo apache

echo "> Backup /home/apache/.ssh/authorized_keys"
sudo cp /home/vagrant/.bashrc /home/apache/.ssh/bashrc.$NOW
sudo chown apache:apache /home/apache/.ssh/bashrc.$NOW
