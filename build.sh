#!/bin/bash
set -xe

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

if ! which arm-none-linux-gnueabi-gcc; then
    echo "arm-none-linux-gnueabi-gcc is required to compile software"
    echo "make sure you have it in PATH"
    exit 1
fi

dir=$(expand c-ares*.tar.*)
build $dir

dir=$(expand curl*.tar.*)
build $dir

build opkg
