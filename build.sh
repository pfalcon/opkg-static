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
    (cd $dir; ../build/$dir/build.sh)
}

dir=$(expand c-ares*.tar.*)
build $dir

dir=$(expand curl*.tar.*)
build $dir

build opkg
