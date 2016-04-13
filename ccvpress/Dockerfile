FROM wordpress:4.4.2
RUN apt-get update && apt-get install -y \
      curl \
	  rsync \
	  wget \
	  git \
	  unzip
RUN docker-php-ext-install mysql
