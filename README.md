### zfs-snapshot

The following script allows you to create ZFS snapshots of EOS blocks/ and state/  folders.


#### Requirements

* Working ZFS install
* ZFS volume 
* When starting nodeos you should point your data-dir to your ZFS volume.

Example startup script that poins --data-dir to my ZFS volumed called eos.

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




*/15 * * * * sudo -u charles  "/opt/scripts/zfs-backup.sh"
