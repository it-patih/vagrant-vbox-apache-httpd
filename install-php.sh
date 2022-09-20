#!/bin/bash

echo "###"
echo "### install php.sh ###"
id
echo "###"

NOW=$(date +"%Y%m%d-%H%M%S")
ssh -q -o StrictHostKeyChecking=no apache@localhost bash -c "'
id

echo \"> Downloading php\"
wget https://www.php.net/distributions/php-8.1.10.tar.gz -P /opt/apache-httpd/srclib
tar -xzf /opt/apache-httpd/srclib/php-8.1.10.tar.gz -C /opt/apache-httpd/srclib

echo \"> Installing php\"
cd /opt/apache-httpd/srclib/php-8.1.10
./configure --prefix=/opt/apache-httpd/lib/php-8.1.10 \
    --with-apxs2=/opt/apache-httpd/httpd/bin/apxs \
    --enable-mysqlnd \
    --with-pdo-mysql=mysqlnd \
    --with-mysqli=mysqlnd \
    --enable-shmop \
    --enable-sockets \
    --enable-sysvmsg \
    --enable-sysvsem \
    --enable-sysvshm \
    --enable-bcmath \
    --enable-mbstring \
    --with-mhash \
    --with-zip \
    --with-zlib \
    --with-curl \
    --with-pear \
    --with-openssl \
    --enable-calendar \
    --enable-exif \
    --enable-gd \
    --with-avif \
    --with-webp \
    --with-jpeg \
    --with-xpm \
    --with-freetype \
    --enable-pcntl \
    --with-readline
make
make install

cp /opt/apache-httpd/srclib/php-8.1.10/php.ini-development /opt/apache-httpd/lib/php-8.1.10/lib/php.ini


'"