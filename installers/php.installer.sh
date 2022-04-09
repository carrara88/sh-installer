#!/bin/bash

##########################################################################################
# INSTALLER->php - install PHP 
# php.installer.sh script for installer.sh
# PHP setup
##########################################################################################

# PHP
echo "${EMPTY}"
echo "${LINECAP} php setup"
echo "${EMPTY}"

if command -v php &> /dev/null 
then
    echo "php is installed, skipping..."
else
    sudo apt-get install php-fpm php-opcache php-cli php-gd php-curl -y # php
fi

# RESTART
echo "${EMPTY}"
echo "${LINECAP} apache restart"
sudo service apache2 restart

# TOUCH-STATUS
sudo touch "${INSTALLED_DIR}/php.status" #touch .status file