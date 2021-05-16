# !!! Only support to PHP 7
FROM php:7-apache

# For debug and edit config
RUN apt-get update && apt-get -y install vim

# Enable mod_rewrite
RUN a2enmod rewrite

# Clean html directory
RUN rm /var/www/html/* -rf

WORKDIR /root/files

# Add wordpress-sqlite plugin from https://github.com/aaemnnosttv/wp-sqlite-db
ADD db.php wp-config.php htaccess ./

ADD launch.sh ./
CMD ./launch.sh
