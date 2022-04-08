#!/bin/bash

##########################################################################################
# INSTALLER - enable to run single or multiple .sh
# check out # MAIN-LOOP section at the end of this file 
# examples:
# --- installer commands (single) run on bash:
#       $ ./installer.sh [script:string] [mode:integer] [arg-1] [arg-2] [arg-3]
#       $ ./installer.sh php
#       $ ./installer.sh php 1
#       $ ./installer.sh samba 1
# --- for installer selector (multiple) run on bash:
#       $ ./installer.sh
##########################################################################################

# TOOLS
source "./installer-tools.sh" # shared fn and vars
# CONFIGURATIONS
INSTALLER_LOOP=true
OS_VERSION="bullseye" # OS version
INSTALLER_DIR="/home/pi/Desktop/sh-installer/installers" # base installer scripts dir
# SETUPS
DESTINATION="/var/www/server" # installers destination dir
INSTALLED="${DESTINATION}/installed" # installers status dir


# PARAMETERS
parametersInstaller(){
    while [ $# -gt 0 ]; do
        case "$1" in
            --script|-s=*)
            SCRIPT="${1#*=}"
            ;;
            --mode|-m=*)
            MODE="${1#*=}"
            ;;
            *)
            echo "${LINECAP} Error: Invalid argument."
            exit 1
        esac
        shift
    done
}
updateSystem(){
    sudo apt-get update -y
    sudo apt-get upgrade -y
}
# INIT
beforeInstaller(){
    mkdir -p ${DESTINATION} # make destination dir
    mkdir -p ${INSTALLED} # make installed dir
}
# EXEC
execInstaller () {
    
    echo "${LINESTEP} [$1]"
    echo "${LINECAP} start"

    if [[ "$2" -eq "1" ]]; then  # force installation remove previous installer status file
        forceInstaller $1
    fi
   
    if [ -f "${INSTALLED}/$1.status" ]; then # stop installer if .status file exist
        echo "${LINECAP} stopped!"
        echo "${LINECAP} $1.status already exists, installation in progress or completed."
    else # start installer if .status file missing
        echo "${LINECAP} searching for $1.installer.sh script."
        if [ -f "${INSTALLER_DIR}/$1.installer.sh" ]; then # check for scripts
            echo "${LINECAP} $1.installer.sh loaded."
            if [ -d "${INSTALLED}/$1" ]; then
                mkdir -p ${INSTALLED}/$1 # make installed dir
                chmod -R 755 ${INSTALLED}/$1
            fi
            source "${INSTALLER_DIR}/$1.installer.sh" # exec installer script
        else
            echo "${LINEALERT} $1.installer.sh missing!"
        fi

        echo "${LINECAP} end"
    fi

}
# FORCE
forceInstaller(){
    echo "${LINECAP} overwrite ${INSTALLED}/$1.status"   
    if [ -f "${INSTALLED}/$1.status" ]; then
        rm "${INSTALLED}/$1.status" # remove old .status file from installed dir
        echo "${LINECAP} $1.status cleaned."
    else 
        echo "${LINECAP} $1.status already cleaned."
    fi
}
# SELECT
selectInstaller(){
    options=("samba" "node" "gstreamer" "apache" "php" "mysql" "lcd" "[update/upgrade]" "[reboot]" "[exit]")
    select opt in "${options[@]}" ; do
        case $opt in
            "samba")
                execInstaller "samba" ${MODE}
                break
            ;;
            "node")
                execInstaller "node" ${MODE}
                break
            ;;
            "php")
                execInstaller "php" ${MODE}
                break
            ;;
            "apache")
                execInstaller "apache" ${MODE}
                break
            ;;
            "mysql")
                execInstaller "mysql" ${MODE}
                break
            ;;
            "gstreamer")
                execInstaller "gstreamer" ${MODE}
                break
            ;;
            "lcd")
                execInstaller "lcd" ${MODE}
                break
            ;;
            "[reboot]")
                sudo reboot
            ;;
            "[update/upgrade]")
                updateSystem
                break
            ;;
            "[exit]")
                INSTALLER_LOOP=false
                break
            ;;
            *) 
                echo "${LINEALERT} Invalid option: $REPLY"
            ;;
        esac
    done
}
# LOOP
loopInstaller(){
    echo "${LINE}"
    echo "${LINETITLE}"
    echo "${LINECAP} version: ${OS_VERSION}"
    echo "${LINECAP} script: ${SCRIPT}"
    echo "${LINECAP} mode: ${MODE}"

    while [  $INSTALLER_LOOP = true  ]; do # loop until exit
        if [ ! -z "${SCRIPT}" ]; then # if parameter exist
            INSTALLER_LOOP=false  # stop installer loop
            execInstaller ${SCRIPT} ${MODE} #  exec installer
        else  # if parameter missing
            selectInstaller # select installer
        fi
    done
    echo ${LINEBYE}
}


# MAIN-LOOP
parametersInstaller $1 $2 $3 $4 $5 $6 $7 $8 $9 #load script parameters
beforeInstaller # run initialization
loopInstaller # run main loop
exit 0 # Exit from the script with success (0)