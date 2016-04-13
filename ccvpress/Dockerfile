FROM wordpress:4.4.2

#Sets the timezone
RUN echo "Asia/Ho_Chi_Minh" > /etc/timezone && \
      dpkg-reconfigure --frontend noninteractive tzdata

#Installs required packages
RUN apt-get update && apt-get install -y \
      curl \
	  rsync \
	  wget \
	  git \
	  unzip \
	  cron \
	  nano \
	  sudo \
	  rsyslog

#Installs the mysql client for php.  CiviCRM still uses mysql - not mysqli.  CiviCRM won't allow install onto the wordpress:4.4.2 image without this.
RUN docker-php-ext-install mysql

#Installs the wordpress cli tool.  CiviCRM expects a cron job to run that triggers its scheduled jobs and it's easier to run this with the wordpress cli tool - wp-cli.
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

#Copies the cron job that CiviCRM expects from the host to the container in a text file
ADD cronjob.txt /config/cronjob.txt

#Adds the cron job that CiviCRM expects to the www-data users crontab
RUN crontab -u www-data /config/cronjob.txt

#Download and unpack civicrm into place to prepare for the install.  Looks like this may have to be done after the docker containers are brought up.
#wget https://download.civicrm.org/civicrm-4.7.6-wordpress.zip && mkdir -p /var/www/html/wp-content/plugins  && mv civicrm-4.7.6-wordpress.zip /var/www/html/wp-content/plugins/civicrm-4.7.6-wordpress.zip  && unzip /var/www/html/wp-content/plugins/civicrm-4.7.6-wordpress.zip -d /var/www/html/wp-content/plugins

