# civicrm-wp4.5-docker
Docker Compose to set up CiviCRM on Wordpress 4.5 for the Canadian Chamber of Commerce in Vietnam

* Using mysql 5.6 as civicrm plugin has long lock names that mysql 5.7 doesn't accept.
* Limiting memory for the containers at 200M as the host this runs on may only have 768M
* Don't forget to change the MYSQL_ROOT_PASSWORD in docker-compose.yml with something more secure
* Don't forget to change the SITE, DBPASS and SITEPASS variables in ccvpress\config_wordpress.sh

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
+ Change the SITE, DBPASS and SITEPASS variables in the ccvpress/config_wordpress.sh file
+ Change the MYSQL_ROOT_PASSWORD in the docker-compose.yml file.  Should be the same as DBPASS
+ Bring the system up
```
	docker-compose up -d
```
+ If this is a fresh install, wait a few minutes for supervisor to finish running the onetime_config_wordpress process
+ Open the site in a browser, log into the site admin area with the ccvAdmin account and the SITEPASS you set in ccvpress/config_wordpress.sh
+ Go to the plugins area
+ Activate the CiviCRM plugin
+ Complete the CiviCRM install, let the page refresh.
+ Wait 5 minutes after the completion of the CiviCRM install for the first cron job to run, and the error to go away.
+ Begin configuring CiviCRM.
