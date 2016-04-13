# civicrm-docker
Docker Compose to set up CiviCRM for the Canadian Chamber of Commerce in Vietnam

* Using mysql 5.6 as civicrm plugin has long lock names that mysql 5.7 doesn't accept.
* Limiting memory for the containers at 200M as the host this runs on may only have 768M
* Don't forget to change the MYSQL_ROOT_PASSWORD in docker-compose.yml with something more secure

## To use this

+ Install docker and docker-compose on your machine.  We will refer to this as your docker host going forward.
+ Make folders on your docker host for the data volume mappings (optional - copy data from the current site or backup)
```
	mkdir /home/ccvAdmin/wwwData
	mkdir /home/ccvAdmin/mysqlData
```
+ Clone this repository
```
	git clone https://github.com/CanChamVietnam/civicrm-docker
```
+ Change the MYSQL_ROOT_PASSWORD in the docker-compose.yml file
+ Bring the system up
```
	docker-compose up -d
```
+ Open the site in a browser and complete the very brief wordpress install.  Use ccvAdmin as the admin name when going through the install.
+ Download and unpack civicrm into the ccvpress container.  The docker exec command gets you into the wordpress container, and the wget command handles retrieval, and extraction of CiviCRM into the correct folder location.
```
docker exec -ti ccvpress_1 /bin/bash
wget https://download.civicrm.org/civicrm-4.7.6-wordpress.zip && mkdir -p /var/www/html/wp-content/plugins  && mv civicrm-4.7.6-wordpress.zip /var/www/html/wp-content/plugins/civicrm-4.7.6-wordpress.zip  && unzip /var/www/html/wp-content/plugins/civicrm-4.7.6-wordpress.zip -d /var/www/html/wp-content/plugins
```
+ Open the site in a browser and go to the plugins area in wordpress
+ Activate the CiviCRM plugin, refresh the page.
+ Complete the CiviCRM install, refresh the page.
+ Begin configuring CiviCRM.

## Notes

+ This expects you to use ccvAdmin as the admin name for wordpress.  If you choose a different name, check the crontab for the www-data user and update it accordingly.
	