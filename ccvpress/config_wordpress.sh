#!/bin/bash

sudo -u www-data -- wp core config --dbname=wordpress --dbuser=root --dbpass=insecurepass --dbhost=mysql --path=/var/www2/html && \
  sudo -u www-data -- wp db create --path=/var/www2/html && \
  sudo -u www-data -- wp core install --url=http://10.10.10.56 --title=ccv --admin_user=ccvAdmin --admin_password=insecurepass --admin_email=info@canchamvietnam.org --path=/var/www2/html

