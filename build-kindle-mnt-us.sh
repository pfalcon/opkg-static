#!/bin/sh

# Main prefix, opkg-static will be installed into $PREFIX/bin
export PREFIX=/mnt/us
# Where config files will be kept, "/opkg" will be appended automatically for opkg config files
export SYSCONFDIR=$PREFIX/etc
# Where package info files, etc. will be kept, "/opkg" will be appended
# automatically
export OPKG_LIB_DIR=$PREFIX/var/lib

. ./build.sh
