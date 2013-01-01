for patch in $(dirname $0)/*.patch; do
    patch --forward -p1 < $patch
done

./configure --host=arm-none-linux-gnueabi \
    --disable-shared CFLAGS='--static' LDFLAGS='--static' \
    --prefix=$PWD/install
make
make install
