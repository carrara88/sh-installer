# sh-installer
automatic bash installer scripts

## Installer Usage
There are 2 ways to run installer, [Selector] and [Commands]
Use [Selector] to perform GUI installer loop, use [Commands] to bypass GUI loop and run single installer script.

### Installer - Selector
Main installer execute a GUI script selector
To perform single or multiple installer scripts open console and run:
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
$ ./installer.sh "php" 1
```