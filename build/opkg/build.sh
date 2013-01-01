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
    --prefix=/data/local \
    --with-opkglibdir=/data/local \
    --with-opkgetcdir=/data/local/etc
make
make install-strip prefix=$PWD/install transform='s/-cl/-static/'
