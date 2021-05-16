#!/bin/bash
# Create directories
mkdir /var/www/db /var/www/html -p

# If /var/www/html is empty, start wordpress download
if [[ `ls /var/www/html | wc -l` -eq 0 ]]; then
  curl -sS https://wordpress.org/latest.tar.gz > /tmp/latest.tar.gz
  tar zxf /tmp/latest.tar.gz -C /tmp/
  mv /tmp/wordpress/* /var/www/html
  rm /tmp/latest.tar.gz /tmp/wordpress -rf
  \cp /root/files/db.php /var/www/html/wp-content/
  \cp /root/files/wp-config.php /var/www/html/
  \cp /root/files/htaccess /var/www/html/.htaccess
fi

# Prevent permission problems
chown www-data:www-data /var/www -R

# Run apache2 in foreground
apache2-foreground
