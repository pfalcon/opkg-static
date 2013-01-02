#!/bin/bash
set -e

OPKG_SVN_REV=649

function download() {
    url="$1"
    file=$(basename "$url")
    if [ ! -f "$file" ]; then
        wget "$url"
    fi
}

download http://curl.haxx.se/download/curl-7.28.1.tar.bz2
download http://c-ares.haxx.se/download/c-ares-1.9.1.tar.gz
if [ ! -d opkg ]; then
    svn co -r$OPKG_SVN_REV http://opkg.googlecode.com/svn/trunk/ opkg
else
    (cd opkg; svn update -r$OPKG_SVN_REV)
fi
