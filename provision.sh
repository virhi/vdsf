#!/bin/sh

sudo apt-get update
sudo apt-get -y install docker.io
sudo ln -sf /usr/bin/docker.io /usr/local/bin/docker
sudo sed -i '$acomplete -F _docker docker' /etc/bash_completion.d/docker.io
sudo apt-get -y install php5-cli

sudo docker build --tag="virhi/ubuntu_nginx_phpfpm" /vagrant

#sudo cd /vagrant/symfoy
#sudo php composer.phar install

sudo docker run -d -p 8000:8000 -v /vagrant/symfony:/var/www/site -v /vagrant/log:/var/log/nginx virhi/ubuntu_nginx_phpfpm