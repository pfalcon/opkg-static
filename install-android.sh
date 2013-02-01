#!/bin/sh

BASE=/data/local

adb shell mkdir $BASE/bin
adb shell mkdir $BASE/etc
adb shell mkdir $BASE/etc/opkg
adb shell mkdir $BASE/var/
adb shell mkdir $BASE/var/lib
adb shell mkdir $BASE/var/lib/opkg

adb push skel/etc/passwd $BASE/etc
adb push skel/etc/group $BASE/etc
adb push skel/etc/resolv.conf $BASE/etc

adb push opkg/install/bin/opkg-static $BASE/bin
adb push skel/etc/opkg/options.conf $BASE/etc/opkg
adb push skel/etc/opkg/arch.conf $BASE/etc/opkg
adb push skel/etc/opkg/oe-android.conf $BASE/etc/opkg
adb push oe $BASE

echo "Run:"
echo "adb shell"
echo ". /data/local/oe"
echo "opkg-static --help"
