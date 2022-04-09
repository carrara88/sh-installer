#!/bin/bash

##########################################################################################
# INSTALLER->mysql - install MYSQL 
# mysql.installer.sh script for installer.sh
# mariadb-server + php-mysql setup
##########################################################################################

# MYSQL
echo "${EMPTY}"
echo "${LINECAP} mysql setup"
echo "${EMPTY}"

if command -v mysql &> /dev/null 
then
    echo "mysql is installed, skipping..."
else
    sudo apt-get install mariadb-server php-mysql -y # mysql
    sudo mysql_secure_installation -y
fi

# RESTART
echo "${EMPTY}"
echo "${LINECAP} apache restart"
sudo service apache2 restart

# TOUCH-STATUS
touch "${INSTALLED_DIR}/mysql.status" #touch .status file