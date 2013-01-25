if [ -z "$PREFIX" ]; then
    echo "PREFIX not defined"
    exit 1
fi

autoreconf -v --install || exit 1
glib-gettextize --force --copy || exit 1
make clean || true
./configure CFLAGS='--static -Os' LDFLAGS='--static' \
    CURL_CFLAGS="-I$PWD/../curl-7.28.1/install/include" \
    CURL_LIBS="-L$PWD/../curl-7.28.1/install/lib -lcurl" \
    --host=arm-none-linux-gnueabi \
    --disable-shared \
    --disable-gpg \
    --enable-curl \
    --disable-ssl-curl \
    --prefix="$PREFIX" \
    --with-opkglibdir="$OPKG_LIB_DIR" \
    --with-opkgetcdir="$SYSCONFDIR"
make
make install-strip prefix=$PWD/install transform='s/-cl/-static/'

echo
echo "****************"
echo "opkg build finished, binaries are in $PWD/install/bin"
echo "****************"
