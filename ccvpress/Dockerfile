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
RUN crontab -u root /config/cronjob.txt

#Installing supervisor to allow for running of apache, cron and rsyslog
ADD ./etc-supervisord.conf /etc/supervisord.conf
ADD ./etc-supervisor-conf.d-supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN mkdir -p /var/log/supervisor/

#Bash script to set up the DB and install Wordpress.  To be run by supervisor once when the container starts.  Will only make changes if /var/www/html is empty.
ADD config_wordpress.sh /config/config_wordpress.sh
RUN chmod +x /config/config_wordpress.sh

EXPOSE 80
CMD ["/usr/bin/supervisord"]