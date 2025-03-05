#!/usr/bin/env -S bash ../.port_include.sh

source ../python3/version.sh

port='meson'
version='1.7.0'
files=(
    "https://github.com/mesonbuild/meson/releases/download/${version}/meson-${version}.tar.gz#08efbe84803eed07f863b05092d653a9d348f7038761d900412fddf56deb0284"
)
depends=(
    'python3'
    'ninja'
)

configure() {
    :
}

build() {
    :
}

install() {
    cd "meson-${version}"
    cp -rvf "mesonbuild" "${SERENITY_INSTALL_ROOT}/usr/local/lib/python${PYTHON_VERSION%.*}/site-packages"
    cp -vf "meson.py" "${SERENITY_INSTALL_ROOT}/usr/local/bin/meson"
}
