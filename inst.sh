#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   	echo "This script must be run as sudo"
   	exit 1
else
#
cd $PWD/Repository
#Update and Upgrade
apt update && apt upgrade -y
#Base packages*
echo "**INSTALLING BASE PACKAGES**"
echo "1"
apt install apache2 php -y
echo "**CREATING DIRECTORIES**"
rm -rv /var/www/html/*
mkdir -pv /var/www/html/files
chmod 755 -R /var/www/html/files
echo "**SETTING UP BASE**"
rm -v /etc/apache2/sites-available/000-default.conf
cp -v 000-default.conf /etc/apache2/sites-available
cp -v index.html script.js upload.php style.css /var/www/html
echo "**ENTER A PASSWORD TO ACCESS THE SENT FILES**"
htpasswd -c /etc/apache2/.htpasswd emperor
systemctl restart apache2
#End
echo "**END**"
