#!/usr/bin/env -S bash ../.port_include.sh
port='libepoxy'
version='1.5.10'
archive_hash='072cda4b59dd098bba8c2363a6247299db1fa89411dc221c8b81b8ee8192e623'
files=(
    "https://download.gnome.org/sources/libepoxy/${version%.*}/libepoxy-${version}.tar.xz#${archive_hash}"
)
useconfigure='true'
configopts=(
    "--cross-file=${SERENITY_BUILD_DIR}/meson-cross-file.txt"
    "--prefix=${SERENITY_INSTALL_ROOT}/usr/local"
    '-Dbuildtype=release'
    '-Dglx=no'
    '-Degl=no'
    '-Dx11=false'
    '-Dtests=false'
)

configure() {
    run meson setup "${configopts[@]}" build
}

build() {
    run ninja -C build
}

install() {
    run ninja -C build install
}
