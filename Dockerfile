FROM wordpress:latest

COPY default-ssl.conf /etc/apache2/sites-available
RUN ln -s /etc/apache2/sites-available/default-ssl.conf /etc/apache2/sites-enabled/default-ssl.conf

COPY .htaccess /var/www/html

RUN ln -s /etc/apache2/mods-available/ssl.load /etc/apache2/mods-enabled/ssl.load
RUN ln -s /etc/apache2/mods-available/socache_shmcb.load /etc/apache2/mods-enabled/socache_shmcb.load

COPY ./D4skivvy /var/www/html/wp-content/themes/
COPY ./D4-Base-Plugin /var/www/html/wp-content/plugins/

EXPOSE 443
EXPOSE 80
