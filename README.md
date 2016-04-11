# civicrm-docker
Docker Compose to set up CiviCRM for the Canadian Chamber of Commerce in Vietnam

* Using mysql 5.5 as there seem to be issues installing the civicrm plugin when using mysql:latest
* Limiting memory for the containers at 200M as the host this runs on may only have 768M
* Don't forget to change the MYSQL_ROOT_PASSWORD in docker-compose.yml with something more secure

## To use this

1. Install docker and docker-compose on your machine.
2. Make folders on your docker host for the data volume mappings

	mkdir /home/ccvAdmin/wwwData
	mkdir /home/ccvAdmin/mysqlData

3. Clone this repository

	git clone https://github.com/CanChamVietnam/civicrm-docker

4. docker-compose up -d
	