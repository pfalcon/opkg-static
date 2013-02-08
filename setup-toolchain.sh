#!/bin/bash
set -e

file="arm-2011.09-70-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2"
dir="arm-2011.09"


if [ "$0" == "./setup-toolchain.sh" ]; then

    echo "You rather should source this file: \". $0\""

else
    if [ ! -d $dir ]; then

        if [ ! -f $file ]; then
            wget https://sourcery.mentor.com/GNUToolchain/package9728/public/arm-none-linux-gnueabi/$file
        fi

        tar xfj $file
    fi

    export PATH=$PWD/arm-2011.09/bin:$PATH
fi
