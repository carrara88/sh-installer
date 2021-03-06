#!/bin/bash

##########################################################################################
# INSTALLER->samba - install SAMBA 
# samba.installer.sh script for installer.sh
# SAMBA user root setup
##########################################################################################

# ASKS
_SAMBA_USER(){ # 
    read -p "${LINECAP} Select user for SAMBA root folder:" SAMBA_USER
}

# SAMBA
echo "${EMPTY}"
echo "${LINECAP} SAMBA setup"
echo "${EMPTY}"

if command -v samba &> /dev/null 
then
    echo "samba is installed, skipping..."
else
    sudo apt-get install samba samba-common-bin
fi

_SAMBA_USER
sudo smbpasswd -a $SAMBA_USER
echo "[${SAMBA_USER}_root]
comment= root for $SAMBA_USER
path = /
browseable = Yes
writeable = Yes
only guest = no
create mask = 0755
directory mask = 0755
public = no
force user = $SAMBA_USER" > SABACONFIGS
sudo appendToFile "/etc/samba/smb.conf" SABACONFIGS
sudo /etc/init.d/smbd restart


# TOUCH-STATUS
sudo touch "${INSTALLED_DIR}/samba.status" #touch .status file