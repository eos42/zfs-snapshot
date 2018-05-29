### zfs-snapshot

The following script allows you to create ZFS snapshots of EOS blocks/ and state/  folders.
Please note this is not for block producers, as you need to stop your nodeos process.

#### TO-DO

Remove old snapshots once per day - set daily cron to remove snapshots and create new one and then let hourly take over.


#### Requirements

* Working ZFS install
* ZFS volume 
* When starting nodeos you should point your data-dir to your ZFS volume.



## Installation
### Step 1 - Reconfigure your Nodeos startup script.

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

### Step 2 - Install zfs-backup script.

* Download and place the zfs-backup.sh in a folder of your choice.
* Give executable permissions ```Chmod +x /opt/scripts/zfs-backup.sh```


### Step 3 - Create Cronfile to run hourly at minute 59.

* Add the following to your /etc/cron.d.
* replace %username% what you use to start and stop nodeos
* ```*/59 * * * * root sudo -u charles  "/opt/scripts/zfs-backup.sh"```


### Addtional information.
* The reasoning behind sudo -u %username% is because we want nodeos to start with a non root user, but we need ZFS to run as root. 


