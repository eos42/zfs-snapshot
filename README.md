### zfs-snapshot

The following script allows you to create ZFS snapshots of EOS blocks/ and state/  folders.


#### Requirements

* Working ZFS install
* ZFS volume 
* When starting nodeos you should point your data-dir to your ZFS volume.



## Installation
### Step 1 - reconfigure your startup script

* We need to modify your startup scripts to point our --data-dir to our ZFS volumes. 
* My volume is called eos.

```
#!/bin/bash
################################################################################
#
# Scrip Created by http://CryptoLions.io
# For EOS Junlge testnet
#
# https://github.com/CryptoLions/
#
################################################################################
NODEOS=/opt/eos/build2/programs/nodeos/nodeos
DATADIR=/opt/JungleTestnet-panthereos42
ZFS=/eos
$DATADIR/stop.sh
$NODEOS --data-dir $ZFS --config-dir $DATADIR "$@" > $DATADIR/stdout.txt 2> $DATADIR/stderr.txt &  echo $! > $DATADIR/nodeos.pid
```

### Step 2 - Install zfs-backuyp script.

* Download and place the zfs-backup.sh in a folder of your choice.
* Give executable permissions ```Chmod +x /opt/scripts/zfs-backup.sh```


### Step 3 - Create Cronfile.

* Add the following to your /etc/cron.d. (or your users cron using crontab -e)
* replace %username% what you use to start and stop nodeos
* ```*/15 * * * * root sudo -u &username% "/opt/scripts/zfs-backup.sh"```


### Addtional information.
* The reasoning behind sudo -u %username% is because we want nodeos to start with a non root user, but we need ZFS to run as root. 


