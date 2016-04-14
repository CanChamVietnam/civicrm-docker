#!/bin/bash
DIR="/var/www/html"
DBPASS="insecurepass"
SITEPASS="insecurepass"
SITE="http://10.10.10.56"

if [ "$(ls -A $DIR)" ] ; then
    echo "Looks like $DIR is not empty, not installing"
else
    cp -R /usr/src/wordpress/* $DIR && \
      chown -R www-data:www-data $DIR && \
	  sudo -u www-data -- wp core config --dbname=wordpress --dbuser=root --dbpass=$DBPASS --dbhost=mysql --path=$DIR && \
      sudo -u www-data -- wp db create --path=$DIR && \
      sudo -u www-data -- wp core install --url=$SITE --title=ccv --admin_user=ccvAdmin --admin_password=$SITEPASS --admin_email=info@canchamvietnam.org --path=$DIR && \
	  wget https://download.civicrm.org/civicrm-4.7.6-wordpress.zip && \
	  mkdir -p $DIR/wp-content/plugins  && \
	  mv civicrm-4.7.6-wordpress.zip $DIR/wp-content/plugins/civicrm-4.7.6-wordpress.zip  && \
	  unzip $DIR/wp-content/plugins/civicrm-4.7.6-wordpress.zip -d $DIR/wp-content/plugins
fi
