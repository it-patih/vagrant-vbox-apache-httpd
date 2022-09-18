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
wget https://dlcdn.apache.org/httpd/httpd-2.4.54.tar.gz -P /opt/apache/httpd/srclib
wget https://dlcdn.apache.org/apr/apr-1.7.0.tar.gz -P /opt/apache/httpd/srclib
wget https://dlcdn.apache.org/apr/apr-util-1.6.1.tar.gz -P /opt/apache/httpd/srclib
wget https://onboardcloud.dl.sourceforge.net/project/pcre/pcre2/10.37/pcre2-10.37.tar.gz -P /opt/apache/httpd/srclib

tar -xzf /opt/apache/httpd/srclib/httpd-2.4.54.tar.gz -C /opt/apache/httpd/srclib
tar -xzf /opt/apache/httpd/srclib/apr-1.7.0.tar.gz -C /opt/apache/httpd/srclib
tar -xzf /opt/apache/httpd/srclib/apr-util-1.6.1.tar.gz -C /opt/apache/httpd/srclib
tar -xzf /opt/apache/httpd/srclib/pcre2-10.37.tar.gz -C /opt/apache/httpd/srclib
'"