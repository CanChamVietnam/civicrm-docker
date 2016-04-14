#!/bin/bash
DIR="/var/www2/html"
if [ "$(ls -A $DIR)" ] ; then
    echo "Looks like $DIR is not empty, not installing"
else
    cp -R /usr/src/wordpress/* /var/www2/html && \
      chown -R www-data:www-data /var/www2/html && \
	  sudo -u www-data -- wp core config --dbname=wordpress --dbuser=root --dbpass=insecurepass --dbhost=mysql --path=/var/www2/html && \
      sudo -u www-data -- wp db create --path=/var/www2/html && \
      sudo -u www-data -- wp core install --url=http://10.10.10.56 --title=ccv --admin_user=ccvAdmin --admin_password=insecurepass --admin_email=info@canchamvietnam.org --path=/var/www2/html && \
	  wget https://download.civicrm.org/civicrm-4.7.6-wordpress.zip && \
	  mkdir -p /var/www2/html/wp-content/plugins  && \
	  mv civicrm-4.7.6-wordpress.zip /var/www2/html/wp-content/plugins/civicrm-4.7.6-wordpress.zip  && \
	  unzip /var/www2/html/wp-content/plugins/civicrm-4.7.6-wordpress.zip -d /var/www2/html/wp-content/plugins
fi
