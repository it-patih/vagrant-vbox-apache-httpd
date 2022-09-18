#!/bin/bash

echo "###"
echo "### configure-apache-httpd.sh ###"
id
echo "###"

NOW=$(date +"%Y%m%d-%H%M%S")
ssh -q -o StrictHostKeyChecking=no apache@localhost bash -c "'
id

echo \"> Backup original configuration\"
cp /opt/apache-httpd/httpd/conf/httpd.conf /opt/apache-httpd/httpd/conf/httpd.conf.$NOW

echo \"> Change listen from port 80 to port 8080\"
sed -i \"s/Listen 80/Listen 8080/\" /opt/apache-httpd/httpd/conf/httpd.conf


'"