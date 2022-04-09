#!/bin/bash

##########################################################################################
# INSTALLER->lcd - install LCD 
# lcd.installer.sh script for installer.sh
# raspberry-pi LCD35 driver
##########################################################################################

# ASKS
_LCD_SELECTOR(){ # 
    options=("install" "show-lcd" "show-hdmi")
        select opt in "${options[@]}" ; do
            case $opt in
                "install")
                    lcdInstall
                    break
                ;;
                "show-lcd")
                    lcdShow
                    break
                ;;
                "show-hdmi")
                    hdmiShow
                    break
                ;;
                 *) 
                echo "${LINEALERT} Invalid option: $REPLY"
            ;;
        esac
    done
}

# INSTALL
lcdInstall(){
    echo "${EMPTY}"
    echo "${LINECAP} LCD setup"
    echo "${EMPTY}"
    sudo rm -rf ${INSTALLED_DIR}/lcd # remove old files
    sudo git clone https://github.com/goodtft/LCD-show.git ${INSTALLED_DIR}/lcd # download new files
    sudo chmod -R 755 ${INSTALLED_DIR}/lcd # fix permissions
    # TOUCH-STATUS
    sudo touch "${INSTALLED_DIR}/lcd.status" #touch .status file
}
# LCD
lcdShow(){
    echo "${EMPTY}"
    echo "${LINECAP} LCD show"
    echo "${EMPTY}"
    cd ${INSTALLED_DIR}/lcd
    sudo ${INSTALLED_DIR}/lcd/LCD35-show # exec LCD show
    sudo ${INSTALLED_DIR}/lcd/rotate.sh 180 # rotate LCD 180 deg
}
# HDMI
hdmiShow(){
    echo "${EMPTY}"
    echo "${LINECAP} HDMI show"
    echo "${EMPTY}"
    cd ${INSTALLED_DIR}/lcd
    sudo ${INSTALLED_DIR}/lcd/LCD-hdmi # exec HDML show
}

_LCD_SELECTOR

