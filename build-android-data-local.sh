#!/bin/sh

# Main prefix, opkg-static will be installed into $OPKG_PREFIX/bin
export OPKG_PREFIX=/data/local
# Where package info files, etc. will be kept, "/opkg" will be appended
# automatically
export OPKG_LIB_DIR=$OPKG_PREFIX/var/lib
# Where config files will be kept, "/opkg" will be appended automatically
export OPKG_ETC_DIR=$OPKG_PREFIX/etc

. ./build.sh
