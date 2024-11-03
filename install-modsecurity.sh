#!/bin/bash

echo "###"
echo "### install-modsecurity.sh ###"
echo " ref: https://www.rsreese.com/building-apache-and-modsecurity-from-source/"
echo "> command: id"
id
echo "###"

NOW=$(date +"%Y%m%d-%H%M%S")
ssh -q -o StrictHostKeyChecking=no apache@localhost bash -c "'
echo \"> command: id\"
id

echo \"> Downloading modsecurity\"
wget https://github.com/owasp-modsecurity/ModSecurity/releases/download/v2.9.8/modsecurity-v2.9.8.tar.gz -P /opt/apache-httpd/srclib
tar -xzf /opt/apache-httpd/srclib/modsecurity-v2.9.8.tar.gz -C /opt/apache-httpd/srclib

echo \"> Installing modsecurity\"
cd /opt/apache-httpd/srclib/modsecurity-v2.9.8
./autogen.sh
./configure --prefix=/opt/apache-httpd/lib/modsecurity-v2.9.8 --with-apxs=/opt/apache-httpd/httpd/bin/apxs --with-apr=/opt/apache-httpd/lib/apr --with-apu=/opt/apache-httpd/lib/apr-util --with-pcre2
make
make install

echo \"> Configuring modsecurity\"
mkdir /opt/apache-httpd/httpd/conf/modsec
cp /opt/apache-httpd/srclib/modsecurity-v2.9.8/modsecurity.conf-recommended /opt/apache-httpd/httpd/conf/modsec/modsecurity.conf
cp /opt/apache-httpd/srclib/modsecurity-v2.9.8/unicode.mapping /opt/apache-httpd/httpd/conf/modsec/
touch /opt/apache-httpd/httpd/conf/modsec/whitelist.conf

echo \"> Backup original configuration\"
cp /opt/apache-httpd/httpd/conf/modsec/modsecurity.conf /opt/apache-httpd/httpd/conf/modsec/modsecurity.conf.$NOW

echo \"> Update configuration\"
sed -i \"s/SecAuditLog \/var\/log\/modsec_audit.log/SecAuditLog \/opt\/apache-httpd\/httpd\/logs\modsec_audit.log/\" /opt/apache-httpd/httpd/conf/modsec/modsecurity.conf
sed -i \"s/SecRuleEngine DetectionOnly/SecRuleEngine On/\" /opt/apache-httpd/httpd/conf/modsec/modsecurity.conf

echo \"> Downloading owasp-modsecurity\"
wget https://github.com/coreruleset/coreruleset/archive/refs/tags/v4.7.0.tar.gz -P /opt/apache-httpd/srclib
tar -xzf /opt/apache-httpd/srclib/master -C /opt/apache-httpd/srclib

echo \"> Configuring owasp-modsecurity\"
mkdir -p /opt/apache-httpd/httpd/modsecurity.d/crs4/
cp -R /opt/apache-httpd/srclib/coreruleset-4.7.0/ /opt/apache-httpd/httpd/modsecurity.d/crs4/






cp /opt/apache-httpd/httpd/conf/crs/modsecurity_crs_10_setup.conf.example /opt/apache-httpd/httpd/conf/crs/modsecurity_crs_10_setup.conf
ln -s /opt/apache-httpd/httpd/conf/crs/modsecurity_crs_10_setup.conf /opt/apache-httpd/httpd/conf/crs/activated_rules/
for f in `ls /opt/apache-httpd/httpd/conf/crs/base_rules/`; do ln -s /opt/apache-httpd/httpd/conf/crs/base_rules/$f /opt/apache-httpd/httpd/conf/crs/activated_rules/$f; done
for f in `ls /opt/apache-httpd/httpd/conf/crs/optional_rules/ | grep comment_spam` ; do ln -s /opt/apache-httpd/httpd/conf/crs/optional_rules/$f /opt/apache-httpd/httpd/conf/crs/activated_rules/$f ; done

echo \"\" >> /opt/apache-httpd/httpd/conf/httpd.conf
echo \"LoadModule unique_id_module modules/mod_unique_id.so\" >> /opt/apache-httpd/httpd/conf/httpd.conf
echo \"LoadModule security2_module modules/mod_security2.so\" >> /opt/apache-httpd/httpd/conf/httpd.conf
echo \"\<IfModule security2_module\>\" >> /opt/apache-httpd/httpd/conf/httpd.conf
echo \"Include conf/modsec/modsecurity.conf\" >> /opt/apache-httpd/httpd/conf/httpd.conf
echo \"Include conf/crs/activated_rules/*.conf\" >> /opt/apache-httpd/httpd/conf/httpd.conf
echo \"Include conf/modsec/whitelist.conf\" >> /opt/apache-httpd/httpd/conf/httpd.conf
echo \"SecRule ARGS \"mod_security_test\" \"t:normalisePathWin,id:99999,severity:4,msg:'Drive Access'\"\" >> /opt/apache-httpd/httpd/conf/httpd.conf
echo \"\</IfModule\>\" >> /opt/apache-httpd/httpd/conf/httpd.conf

'"









