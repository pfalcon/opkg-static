#!/bin/sh

KINDLE=root@192.168.1.38

BASE=/mnt/us

ssh $KINDLE mkdir -p $BASE/bin
ssh $KINDLE mkdir -p $BASE/var/lib/opkg
scp opkg/install/bin/opkg-static $KINDLE:$BASE/bin/

# TODO: Install config files here

ssh $KINDLE $BASE/bin/opkg-static print-architecture
ssh $KINDLE $BASE/bin/opkg-static list
