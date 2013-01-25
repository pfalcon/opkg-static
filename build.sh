#!/bin/bash
set -e

function expand() {
    tarball=$1
    basename=$(basename ${tarball%.*} .tar)
    echo $basename
    rm -rf basename
    tar xaf $tarball
}

function build() {
    dir=$1
    (cd $dir; ../recipes/$dir/build.sh)
}

if [ -z "$OPKG_PREFIX" -o -z "$OPKG_LIB_DIR" -o -z "$OPKG_ETC_DIR" ]; then
    echo "OPKG_PREFIX and friends are not defined."
    echo "You should not run this file directly, instead run build-* for specific target."
    exit 1
fi

if ! which arm-none-linux-gnueabi-gcc; then
    echo "arm-none-linux-gnueabi-gcc is required to compile software"
    echo "make sure you have it in PATH"
    exit 1
fi

set -x

dir=$(expand c-ares*.tar.*)
build $dir

dir=$(expand curl*.tar.*)
build $dir

build opkg
