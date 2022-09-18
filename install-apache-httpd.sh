#!/bin/bash

echo "###"
echo "### install-apache-httpd.sh ###"
id
echo "###"

sudo mkdir /opt/apache
sudo chown apache:apache /opt/apache

echo "> Download apache-httpd, apr, apr-util, and pcre"
ssh -q -o StrictHostKeyChecking=no apache@localhost bash -c "'
id
mkdir /opt/apache/httpd
mkdir /opt/apache/httpd/srclib

wget https://github.com/libexpat/libexpat/releases/download/R_2_4_8/expat-2.4.8.tar.gz -P /opt/apache/httpd/srclib
tar -xzf /opt/apache/httpd/srclib/expat-2.4.8.tar.gz -C /opt/apache/httpd/srclib

wget https://dlcdn.apache.org/apr/apr-1.7.0.tar.gz -P /opt/apache/httpd/srclib
tar -xzf /opt/apache/httpd/srclib/apr-1.7.0.tar.gz -C /opt/apache/httpd/srclib
mv /opt/apache/httpd/srclib/apr-1.7.0 /opt/apache/httpd/srclib/apr

wget https://dlcdn.apache.org/apr/apr-util-1.6.1.tar.gz -P /opt/apache/httpd/srclib
tar -xzf /opt/apache/httpd/srclib/apr-util-1.6.1.tar.gz -C /opt/apache/httpd/srclib
mv /opt/apache/httpd/srclib/apr-util-1.6.1 /opt/apache/httpd/srclib/apr-util

wget https://github.com/PCRE2Project/pcre2/releases/download/pcre2-10.40/pcre2-10.40.tar.gz -P /opt/apache/httpd/srclib
tar -xzf /opt/apache/httpd/srclib/pcre2-10.40.tar.gz -C /opt/apache/httpd/srclib

wget https://dlcdn.apache.org/httpd/httpd-2.4.54.tar.gz -P /opt/apache/httpd/srclib
tar -xzf /opt/apache/httpd/srclib/httpd-2.4.54.tar.gz -C /opt/apache/httpd/srclib

cd /opt/apache/httpd/srclib/expat-2.4.8
./configure --prefix=/opt/apache/httpd/srclib/expat-2.4.8
make
make install

cd /opt/apache/httpd/srclib/apr
./configure --prefix=/opt/apache/httpd/srclib/apr
make
make install

cd /opt/apache/httpd/srclib/apr-util
./configure --prefix=/opt/apache/httpd/srclib/apr-util --with-apr=/opt/apache/httpd/srclib/apr --with-expat=/opt/apache/httpd/srclib/expat-2.4.8
make
make install

cd /opt/apache/httpd/srclib/pcre2-10.40
./configure --prefix=/opt/apache/httpd/srclib/pcre2-10.40
make
make install

cd /opt/apache/httpd/srclib/httpd-2.4.54
./configure --prefix=/opt/apache/httpd/srclib/httpd-2.4.54 --with-apr=/opt/apache/httpd/srclib/apr --with-apr-util=/opt/apache/httpd/srclib/apr-util --with-expat=/opt/apache/httpd/srclib/expat-2.4.8 --with-pcre=/opt/apache/httpd/srclib/pcre2-10.40/pcre2-config
make
make install

'"