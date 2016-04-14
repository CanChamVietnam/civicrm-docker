FROM wordpress:4.4.2

#Sets the timezone
RUN echo "Asia/Ho_Chi_Minh" > /etc/timezone && \
      dpkg-reconfigure --frontend noninteractive tzdata

#Installs required packages
RUN apt-get update && apt-get install -y \
	  wget \
	  unzip \
	  cron \
	  sudo \
	  rsyslog \
	  mysql-client \
	  supervisor

#Installs the mysql client for php.  CiviCRM still uses mysql - not mysqli.  CiviCRM won't allow install onto the wordpress:4.4.2 image without this.
RUN docker-php-ext-install mysql

#Installs the wordpress cli tool.  CiviCRM expects a cron job to run that triggers its scheduled jobs and it's easier to run this with the wordpress cli tool - wp-cli.
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

#Copies the cron job that CiviCRM expects from the host to the container in a text file
ADD cronjob.txt /config/cronjob.txt

#Adds the cron job that CiviCRM expects to the www-data users crontab
RUN crontab -u www-data /config/cronjob.txt

#Installing supervisor to allow for running of apache, cron and rsyslog
ADD ./etc-supervisord.conf /etc/supervisord.conf
ADD ./etc-supervisor-conf.d-supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN mkdir -p /var/log/supervisor/

#Using /var/www2/html as the Apache DocumentRoot as the wordpress image clobbers /var/www/html with its VOLUME call 
ADD apache2.conf /etc/apache2/apache2.conf
ADD 000-default.conf /etc/apache2/sites-available/000-default.conf
RUN mkdir -p /var/www2/html && \
    cp -R /usr/src/wordpress/* /var/www2/html && \
    chown -R www-data:www-data /var/www2/html
	
#Running wp-cli commands to set up the DB and install Wordpress.  Looks like maybe we need to run these commands after the containers start so mysql can be accessed.
#RUN sudo -u www-data -- wp core config --dbname=wordpress --dbuser=root --dbpass=insecurepass --dbhost=mysql --path=/var/www2/html --skip-check && \
#   sudo -u www-data -- wp db create --path=/var/www2/html && \
#   sudo -u www-data -- wp core install --url=http://10.10.10.60 --title=ccv --admin_user=ccvAdmin --admin_password=insecurepass --admin_email=info@canchamvietnam.org --path=/var/www2/html
ADD config_wordpress.sh /config/config_wordpress.sh
RUN chmod +x /config/config_wordpress.sh

#Download and move CiviCRM into the correct place.
RUN wget https://download.civicrm.org/civicrm-4.7.6-wordpress.zip && mkdir -p /var/www2/html/wp-content/plugins  && mv civicrm-4.7.6-wordpress.zip /var/www2/html/wp-content/plugins/civicrm-4.7.6-wordpress.zip  && unzip /var/www2/html/wp-content/plugins/civicrm-4.7.6-wordpress.zip -d /var/www2/html/wp-content/plugins

EXPOSE 80
CMD ["/usr/bin/supervisord"]