FROM alpine:3.9

RUN apk add --no-cache \
    apache2 \
    php7-apache2 \
    php7-pecl-mcrypt \
    php7-mysqli \
    php7-json

RUN cd /var/www/localhost/htdocs \
 && wget https://github.com/luciozambon/eGiga2m/archive/master.tar.gz \
 && tar xf master.tar.gz \
 && rm master.tar.gz \
 && mv eGiga2m-master eGiga2m

RUN echo 'extension=mysqli' > /etc/php7/php.ini

RUN echo 'extension=json' > /etc/php7/php.ini

COPY resources/egiga2m_conf.js \
    /var/www/localhost/htdocs/eGiga2m/

COPY resources/hdb_conf.php \
    /var/www/localhost/htdocs/eGiga2m/lib/service/

CMD ["httpd", "-DFOREGROUND"]
