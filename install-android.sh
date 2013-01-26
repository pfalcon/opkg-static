#!/bin/sh

BASE=/data/local

adb shell mkdir $BASE/bin
adb shell mkdir $BASE/etc
adb shell mkdir $BASE/etc/opkg
adb shell mkdir $BASE/var/
adb shell mkdir $BASE/var/lib
adb shell mkdir $BASE/var/lib/opkg

adb push passwd $BASE/etc
adb push group $BASE/etc
adb push resolv.conf $BASE/etc

adb push opkg/install/bin/opkg-static $BASE/bin
adb push options.conf $BASE/etc/opkg
adb push arch.conf $BASE/etc/opkg
adb push oe-android.conf $BASE/etc/opkg
adb push oe $BASE
