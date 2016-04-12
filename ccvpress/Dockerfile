FROM ppschweiz/wordpress
RUN apt-get remove -y php5-xcache
RUN apt-get update
RUN apt-get install -y cron
EXPOSE 80
VOLUME "/var/www/html"
ENTRYPOINT ["/entrypoint.sh"]
CMD ["apache2", "-DFOREGROUND"]