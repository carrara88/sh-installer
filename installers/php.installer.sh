#!/bin/bash

##########################################################################################
# INSTALLER->php - install PHP 
# php.installer.sh script for installer.sh
# PHP setup
##########################################################################################

# TOOLS
source "./installer-tools.sh" # shared fn and vars

# PHP
echo "${EMPTY}"
echo "${LINECAP} php setup"
echo "${EMPTY}"
sudo apt-get install php-fpm php-opcache php-cli php-gd php-curl -y # php

# RESTART
echo "${EMPTY}"
echo "${LINECAP} apache restart"
sudo service apache2 restart

# TOUCH-STATUS
touch "${INSTALLED}/php.status" #touch .status file