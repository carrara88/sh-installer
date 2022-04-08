# sh-installer | bash installer scripts

Created for an easy raspberry-pi setup, it can be used on any debian/unix system, enjoy!

#### Available /installers:

 - [x] PHP
 - [x] APACHE
 - [x] MYSQL
 - [x] SAMBA
 - [x] NODE
 - [x] GSTREAMER
 - [x] LCD-TFT Drivers (only for raspberry-pi)

#### Coming-soon /installers:
 - [ ] nginx
 - [ ] fail2ban
 - [ ] modSecurty
 - [ ] watchdog
 - [ ] composer
 - [ ] docker
 - [ ] couchdb

## Installer Config

Edit configurations on top of `installer.sh` file:

```
    # CONFIGURATIONS
    INSTALLER_LOOP=true
    OS_VERSION="bullseye" # OS version
    INSTALLER_DIR="/home/pi/Desktop/sh-installer/installers" # base installer scripts dir
    # SETUPS
    DESTINATION="/var/www/server" # installers destination dir
    INSTALLED="${DESTINATION}/installed" # installers status dir
```

## Installer Usage
There are 2 ways to run installer, [Selector] and [Commands].

Use [Selector] to perform GUI installer loop, use [Commands] to bypass GUI loop and run single installer script.

### Installer - Selector
Main installer execute a GUI script selector. To perform single or multiple installer scripts open console and run:

```
./installer.sh
```

### Installer - Commands
To perform single installer script, open console and run:

```
./installer.sh -s=[script] -m=[mode]
```

#### Script Selector

```
-s = script-name
```

#### Mode Selector

```
-m = mode
```

Scripts are located into `./installers` folder, following the naming pattern `[script].installer.sh`.

##### Examples:

```
$ ./installer.sh "php"
$ ./installer.sh "samba"
$ ./installer.sh "samba" 1
```