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
apt install apache2 -y
echo "**CREATING DIRECTORIES**"
mkdir -pv /var/www/html/files
echo "**SETTING UP BASE**"
rm -v /etc/apache2/sites-available/000-default.conf
cp -v 000-default.conf /etc/apache2/sites-available
