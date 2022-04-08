#!/bin/bash

##########################################################################################
# INSTALLER->node - install nodeJS 
# node.installer.sh script for installer.sh
# nodeJS setup
##########################################################################################

# TOOLS
source "./installer-tools.sh" # shared fn and vars

# APACHE
echo "${EMPTY}"
echo "${LINECAP} nodeJS setup"
echo "${EMPTY}"

curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs

# TOUCH-STATUS
touch "${INSTALLED}/node.status" #touch .status file