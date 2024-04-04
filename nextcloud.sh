#!/bin/bash

apt-get update
sudo apt-get install ca-certificates apt-transport-https software-properties-common wget curl lsb-release -y
curl -sSL https://packages.sury.org/php/README.txt | sudo bash -x
apt-get update -y
apt-get install php8.1 -y
apt-get install libapache2-mod-php8.1 -y
systemctl restart apache2
apt-get install php8.1-fpm php8.1-cli -y
apt-get install php8.1-common php8.1-curl php8.1-bcmath php8.1-intl php8.1-mbstring php8.1-xmlrpc php8.1-mcrypt php8.1-mysql php8.1-gd php8.1-xml php8.1-cli php8.1-zip -y
apt-get install php8.1-fpm libapache2-mod-fcgid -y
a2enmod proxy_fcgi setenvif
a2enconf php8.1-fpm
systemctl restart apache2
apt-get update -y
apt-get install apache2 mariadb-server php8.1 php8.1-common php8.1-curl php8.1-gd php8.1-intl php8.1-mbstring php8.1-xmlrpc php8.1-mysql php8.1-xml php8.1-cli php8.1-zip -y
apt-get install wget unzip -y
cd /tmp
wget https://download.nextcloud.com/server/releases/latest.zip
unzip latest.zip
mv nextcloud/ /var/www/html/
chown -R www-data:www-data /var/www/html/nextcloud
echo "Veuillize saisir le nom de votre base de donnÃ©e"
read bsd
echo "Veuilliez saisir votre utilisateur"
read usr
echo "Veuilliez saisir votre mot de passe"
read mdp
mysql --user=root --password=**** -e "CREATE DATABASE $bsd; CREATE USER '$usr'@'localhost' IDENTIFIED BY '$mdp'; GRANT ALL PRIVILEGES ON $bsd.* TO $usr@localhost; FLUSH PRIVILEGES;"