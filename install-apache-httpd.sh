#!/bin/bash

echo "###"
echo "### install-apache-httpd.sh ###"
echo " ref: https://gist.github.com/adini121/f84c8c92e246359dd6bc"
echo "> command: id"
id
echo "###"

sudo mkdir /opt/apache-httpd
sudo chown apache:apache /opt/apache-httpd

NOW=$(date +"%Y%m%d-%H%M%S")
ssh -q -o StrictHostKeyChecking=no apache@localhost bash -c "'
echo \"> command: id\"
id

echo \"> Downloading expat\"
wget https://github.com/libexpat/libexpat/releases/download/R_2_6_3/expat-2.6.3.tar.gz -P /opt/apache-httpd/srclib
tar -xzf /opt/apache-httpd/srclib/expat-2.6.3.tar.gz -C /opt/apache-httpd/srclib

echo \"> Downloading apr\"
wget https://dlcdn.apache.org/apr/apr-1.7.5.tar.gz -P /opt/apache-httpd/srclib
tar -xzf /opt/apache-httpd/srclib/apr-1.7.5.tar.gz -C /opt/apache-httpd/srclib
mv /opt/apache-httpd/srclib/apr-1.7.5 /opt/apache-httpd/srclib/apr

echo \"> Downloading apr-util\"
wget https://dlcdn.apache.org/apr/apr-util-1.6.3.tar.gz -P /opt/apache-httpd/srclib
tar -xzf /opt/apache-httpd/srclib/apr-util-1.6.3.tar.gz -C /opt/apache-httpd/srclib
mv /opt/apache-httpd/srclib/apr-util-1.6.3 /opt/apache-httpd/srclib/apr-util

echo \"> Downloading pcre2\"
wget https://github.com/PCRE2Project/pcre2/releases/download/pcre2-10.44/pcre2-10.44.tar.gz -P /opt/apache-httpd/srclib
tar -xzf /opt/apache-httpd/srclib/pcre2-10.44.tar.gz -C /opt/apache-httpd/srclib

echo \"> Downloading httpd\"
wget https://dlcdn.apache.org/httpd/httpd-2.4.62.tar.gz -P /opt/apache-httpd/src
tar -xzf /opt/apache-httpd/src/httpd-2.4.62.tar.gz -C /opt/apache-httpd/src

echo \"> Installing expat\"
cd /opt/apache-httpd/srclib/expat-2.6.3
./configure --prefix=/opt/apache-httpd/lib/expat-2.6.3
make
make install

echo \"> Installing apr\"
cd /opt/apache-httpd/srclib/apr
./configure --prefix=/opt/apache-httpd/lib/apr
make
make install

echo \"> Installing apr-util\"
cd /opt/apache-httpd/srclib/apr-util
./configure --prefix=/opt/apache-httpd/lib/apr-util --with-apr=/opt/apache-httpd/lib/apr --with-expat=/opt/apache-httpd/lib/expat-2.6.3
make
make install

echo \"> Installing pcre2\"
cd /opt/apache-httpd/srclib/pcre2-10.44
./configure --prefix=/opt/apache-httpd/lib/pcre2-10.44
make
make install
cp /opt/apache-httpd/srclib/pcre2-10.44/pcre2-config /opt/apache-httpd/lib/pcre2-10.44

echo \"> Installing apache httpd\"
cd /opt/apache-httpd/src/httpd-2.4.62
./configure --prefix=/opt/apache-httpd/httpd-2.4.62 --with-apr=/opt/apache-httpd/lib/apr --with-apr-util=/opt/apache-httpd/lib/apr-util --with-expat=/opt/apache-httpd/lib/expat-2.6.3 --with-pcre=/opt/apache-httpd/lib/pcre2-10.44/pcre2-config
make
make install
ln -s /opt/apache-httpd/httpd-2.4.62 /opt/apache-httpd/httpd


'"