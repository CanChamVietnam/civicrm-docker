# civicrm-docker
Docker Compose to set up CiviCRM for the Canadian Chamber of Commerce in Vietnam

* Using mysql 5.5 as there seem to be issues installing the civicrm plugin when using mysql:latest
* Limiting memory for the containers at 200M as the host this runs on may only have 768M
* Don't forget to change the MYSQL_ROOT_PASSWORD in docker-compose.yml with something more secure

    ccvpress:
      build: .
      links:
        - ccvmysql:mysql
      ports:
        - 80:80
      volumes:
        - /home/ccvAdmin/wwwData:/var/www/html
      mem_limit: 200m
    ccvmysql:
      image: mysql:5.5
      environment:
        MYSQL_ROOT_PASSWORD: insecurepass
      volumes:
        - /home/ccvAdmin/mysqlData:/var/lib/mysql
      mem_limit: 200m
