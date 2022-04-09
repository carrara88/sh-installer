#!/bin/bash

##########################################################################################
# INSTALLER->tools - shared fn and vars
##########################################################################################

# DEFAULTS
PS3="> Select:"
LINE="======================================================="
LINETITLE="====================== INSTALLERS ====================="
LINEBYE="======================== Bye! ========================="
LINESTEP=">"
LINECAP="   | "
LINEALERT="  !! "
EMPTY=""

#FILE
# executable
executableFile(){
    if [ ! -z "$1" ]; then
        chmod +x $1
        chmod 755 $1
        echo "set file [$1] executable"
    fi
}
# appendTo
appendToFile(){
    # $2 = strings
    # $1 = target-file
    sudo awk 'FNR==NR {lines[$0]; next} $0 in lines{delete lines[$0]} END {for (e in lines) print e >> FILENAME}' $1 $2 
}
