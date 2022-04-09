#!/bin/bash

##########################################################################################
# INSTALLER->gstreamer - install GSTREAMER 
# gstreamer.installer.sh script for installer.sh
# gstreamer setup
##########################################################################################

# TOOLS
source "./installer-tools.sh" # shared fn and vars

# ASKS
_GSTREAMER_USER(){ # 
    read -p "${LINECAP} Select user for GSTREAMER root folder:" GSTREAMER_USER
}

# GSTREAMER
echo "${EMPTY}"
echo "${LINECAP} GSTREAMER setup"
echo "${EMPTY}"

sudo apt-get install libgstreamer1.0-dev -y
sudo apt-get install libgstreamer-plugins-base1.0-dev -y
sudo apt-get install libgstreamer-plugins-bad1.0-dev -y
sudo apt-get install gstreamer1.0-plugins-ugly -y
sudo apt-get install gstreamer1.0-tools -y
sudo apt-get install gstreamer1.0-gl -y
sudo apt-get install gstreamer1.0-gtk3 -y
sudo apt-get install gstreamer1.0-pulseaudio -y

#appendToFile "/etc/gstreamer/smb.conf" SABACONFIGS


# TOUCH-STATUS
sudo touch "${INSTALLED}/gstreamer.status" #touch .status file