FROM ubuntu:14.04

MAINTAINER Rhino Vincent <vincent.rhino@gmail.com>

RUN apt-get update
RUN apt-get -y install git
RUN apt-get -y install curl
RUN apt-get -y install nginx
RUN apt-get -y install php5 php5-fpm php5-curl php5-cli

RUN echo "mysql-server mysql-server/root_password password root" | debconf-set-selections
RUN echo "mysql-server mysql-server/root_password_again password root" | debconf-set-selections

RUN apt-get -y install mysql-server mysql-client php5-mysql

ADD dockerConf/nginx.conf /etc/nginx/nginx.conf
ADD dockerConf/run.sh  /run.sh
RUN chmod +x /run.sh

ADD symfony /var/www/site

EXPOSE 80

#RUN mkdir /var/www/site

#WORKDIR /var/www/site
#RUN curl -s http://getcomposer.org/installer | php
#RUN php composer.phar install

CMD ["/run.sh"]