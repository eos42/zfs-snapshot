#!/bin/bash 

# put zfs on the path
PATH=$PATH:/sbin

# Where your starts and stop scripts live.
DATA_DIR="/opt/JungleTestnet-panthereos42"

# Set current time
SNAPSHOT_NAME=`date -d "now" +'%Y_%m_%d-%H_%M'`

# Update with your ZFS filesystem name
FILESYSTEM="eos"


# Stop Nodeos
$DATA_DIR/stop.sh
sleep 3
sudo zfs snapshot $FILESYSTEM@$SNAPSHOT_NAME
$DATA_DIR/stop.sh
