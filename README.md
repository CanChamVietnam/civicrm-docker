# civicrm-docker
Docker Compose to set up CiviCRM for the Canadian Chamber of Commerce in Vietnam

* Using mysql 5.6 as civicrm plugin has long lock names that mysql 5.7 doesn't accept.
* Limiting memory for the containers at 200M as the host this runs on may only have 768M
* Don't forget to change the MYSQL_ROOT_PASSWORD in docker-compose.yml with something more secure
* Don't forget to change the url and admin_password in ccvpress\config_wordpress.sh

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
+ Change the url and admin_password in the ccvpress\config_wordpress.sh file
+ Change the MYSQL_ROOT_PASSWORD in the docker-compose.yml file
+ Bring the system up
```
	docker-compose up -d
```
+ Open the site in a browser, log in with the ccvAdmin account, and go to the plugins area in wordpress
+ Activate the CiviCRM plugin, refresh the page.
+ Complete the CiviCRM install, refresh the page.
+ Begin configuring CiviCRM.
