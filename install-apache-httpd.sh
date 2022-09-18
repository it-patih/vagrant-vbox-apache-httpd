#!/bin/bash

echo "###"
echo "### install-apache-httpd.sh ###"
id
echo "###"

sudo mkdir /opt/apache-httpd
sudo chown apache:apache /opt/apache-httpd

NOW=$(date +"%Y%m%d-%H%M%S")
ssh -q -o StrictHostKeyChecking=no apache@localhost bash -c "'
id

echo \"> Downloading expat\"
wget https://github.com/libexpat/libexpat/releases/download/R_2_4_8/expat-2.4.8.tar.gz -P /opt/apache-httpd/srclib
tar -xzf /opt/apache-httpd/srclib/expat-2.4.8.tar.gz -C /opt/apache-httpd/srclib

echo \"> Downloading apr\"
wget https://dlcdn.apache.org/apr/apr-1.7.0.tar.gz -P /opt/apache-httpd/srclib
tar -xzf /opt/apache-httpd/srclib/apr-1.7.0.tar.gz -C /opt/apache-httpd/srclib
mv /opt/apache-httpd/srclib/apr-1.7.0 /opt/apache-httpd/srclib/apr

echo \"> Downloading apr-util\"
wget https://dlcdn.apache.org/apr/apr-util-1.6.1.tar.gz -P /opt/apache-httpd/srclib
tar -xzf /opt/apache-httpd/srclib/apr-util-1.6.1.tar.gz -C /opt/apache-httpd/srclib
mv /opt/apache-httpd/srclib/apr-util-1.6.1 /opt/apache-httpd/srclib/apr-util

echo \"> Downloading pcre2\"
wget https://github.com/PCRE2Project/pcre2/releases/download/pcre2-10.40/pcre2-10.40.tar.gz -P /opt/apache-httpd/srclib
tar -xzf /opt/apache-httpd/srclib/pcre2-10.40.tar.gz -C /opt/apache-httpd/srclib

echo \"> Downloading httpd\"
wget https://dlcdn.apache.org/httpd/httpd-2.4.54.tar.gz -P /opt/apache-httpd/src
tar -xzf /opt/apache-httpd/src/httpd-2.4.54.tar.gz -C /opt/apache-httpd/src

echo \"> Installing expat\"
cd /opt/apache-httpd/srclib/expat-2.4.8
./configure --prefix=/opt/apache-httpd/lib/expat-2.4.8
make
make install

echo \"> Installing apr\"
cd /opt/apache-httpd/srclib/apr
./configure --prefix=/opt/apache-httpd/lib/apr
make
make install

echo \"> Installing apr-util\"
cd /opt/apache-httpd/srclib/apr-util
./configure --prefix=/opt/apache-httpd/lib/apr-util --with-apr=/opt/apache-httpd/lib/apr --with-expat=/opt/apache-httpd/lib/expat-2.4.8
make
make install

echo \"> Installing pcre2\"
cd /opt/apache-httpd/srclib/pcre2-10.40
./configure --prefix=/opt/apache-httpd/lib/pcre2-10.40
make
make install
cp /opt/apache-httpd/srclib/pcre2-10.40/pcre2-config /opt/apache-httpd/lib/pcre2-10.40

echo \"> Installing apache httpd\"
cd /opt/apache-httpd/src/httpd-2.4.54
./configure --prefix=/opt/apache-httpd/httpd-2.4.54 --with-apr=/opt/apache-httpd/lib/apr --with-apr-util=/opt/apache-httpd/lib/apr-util --with-expat=/opt/apache-httpd/lib/expat-2.4.8 --with-pcre=/opt/apache-httpd/lib/pcre2-10.40/pcre2-config
make
make install
ln -s /opt/apache-httpd/httpd-2.4.54 /opt/apache-httpd/httpd

echo \"> Configuring apache httpd\"
cp /opt/apache-httpd/httpd/conf/httpd.conf /opt/apache-httpd/httpd/conf/httpd.conf.$NOW
sed -i \"s/Listen 80/Listen 8080/\" /opt/apache-httpd/httpd/conf/httpd.conf


'"