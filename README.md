# civicrm-docker
Docker Compose to set up CiviCRM for the Canadian Chamber of Commerce in Vietnam

* Using mysql 5.5 as there seem to be issues installing the civicrm plugin when using mysql:latest
* Limiting memory for the containers at 200M as the host this runs on may only have 768M
* Don't forget to change the MYSQL_ROOT_PASSWORD in docker-compose.yml with something more secure

## To use this

+ Install docker and docker-compose on your machine.
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
	