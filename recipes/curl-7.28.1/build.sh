./configure --host=arm-none-linux-gnueabi --disable-shared \
    --enable-ares=$PWD/../c-ares-1.9.1/install \
    --prefix=$PWD/install
make
make install
