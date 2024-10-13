#!/bin/bash

echo "###"
echo "### configure-apache-httpd.sh ###"
echo "> command: id"
id
echo "###"

NOW=$(date +"%Y%m%d-%H%M%S")
ssh -q -o StrictHostKeyChecking=no apache@localhost bash -c "'
echo \"> command: id\"
id

echo \"> Backup original configuration\"
cp /opt/apache-httpd/httpd/conf/httpd.conf /opt/apache-httpd/httpd/conf/httpd.conf.$NOW

echo \"> Change listen from port 80 to port 8080\"
sed -i \"s/Listen 80/Listen 8080/\" /opt/apache-httpd/httpd/conf/httpd.conf

echo \"> Set ServerName become localhost\"
sed -i \"s/#ServerName www.example.com:80/ServerName localhost/\" /opt/apache-httpd/httpd/conf/httpd.conf

echo \"> Security Hardening\"
sed -i \"s/Options Indexes FollowSymLinks/Options None/\" /opt/apache-httpd/httpd/conf/httpd.conf

echo \"> Enable VirtualHost\"
echo \"\" >> /opt/apache-httpd/httpd/conf/httpd.conf
echo \"# custom-configuration-$NOW\" >> /opt/apache-httpd/httpd/conf/httpd.conf
echo \"IncludeOptional sites-enabled/*.conf\" >> /opt/apache-httpd/httpd/conf/httpd.conf

mkdir /opt/apache-httpd/httpd/sites-available
cp /vagrant/httpd-vhosts1.conf /opt/apache-httpd/httpd/sites-available/
cp /vagrant/httpd-vhosts2.conf /opt/apache-httpd/httpd/sites-available/
chmod 644 /opt/apache-httpd/httpd/sites-available/*

mkdir /opt/apache-httpd/httpd/sites-enabled
ln -s /opt/apache-httpd/httpd/sites-available/httpd-vhosts1.conf /opt/apache-httpd/httpd/sites-enabled/
ln -s /opt/apache-httpd/httpd/sites-available/httpd-vhosts2.conf /opt/apache-httpd/httpd/sites-enabled/

mkdir /opt/apache-httpd/httpd/htdocs-vhost1
cp /vagrant/index-vhost1.html /opt/apache-httpd/httpd/htdocs-vhost1
chmod 644 /opt/apache-httpd/httpd/htdocs-vhost1/*
mkdir /opt/apache-httpd/httpd/htdocs-vhost2
cp /vagrant/index-vhost1.html /opt/apache-httpd/httpd/htdocs-vhost2
chmod 644 /opt/apache-httpd/httpd/htdocs-vhost2/*

'"