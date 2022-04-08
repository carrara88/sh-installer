#!/bin/bash

##########################################################################################
# INSTALLER->apache - install APACHE 
# apache.installer.sh script for installer.sh
# Apache setup
##########################################################################################

# TOOLS
source "./installer-tools.sh" # shared fn and vars

# ASKS
_APACHE_USER(){ # 
    read -p "${LINECAP} Select user for '/var/www' folder:" APACHE_USER
}

# APACHE
echo "${EMPTY}"
echo "${LINECAP} apache setup"
echo "${EMPTY}"
sudo apt install apache2 -y
hostname -I
echo "${EMPTY}"
echo "${LINECAP} apache configuration"
echo "${EMPTY}"
_APACHE_USER
sudo usermod -a -G www-data $APACHE_USER
sudo chown -R -f www-data:www-data /var/www/html
sudo chown -R $APACHE_USER:$APACHE_USER /var/www

# RESTART
echo "${EMPTY}"
echo "${LINECAP} apache restart"
sudo service apache2 restart

# TOUCH-STATUS
touch "${INSTALLED}/apache.status" #touch .status file