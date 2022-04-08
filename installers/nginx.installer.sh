#!/bin/bash

##########################################################################################
# INSTALLER->nginx - install nginx 
# nginx.installer.sh script for installer.sh
# nginx setup
##########################################################################################

# TOOLS
source "./installer-tools.sh" # shared fn and vars

# APACHE
echo "${EMPTY}"
echo "${LINECAP} nginx setup"
echo "${EMPTY}"

sudo apt install nginx

# TOUCH-STATUS
touch "${INSTALLED}/nginx.status" #touch .status file