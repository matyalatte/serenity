#!/usr/bin/env -S bash ../.port_include.sh
port='xkbcommon'
version='1.8.1'
archive_hash='c65c668810db305c4454ba26a10b6d84a96b5469719fe3c729e1c6542b8d0d87'
files=(
    "https://github.com/xkbcommon/libxkbcommon/archive/refs/tags/xkbcommon-${version}.tar.gz#${archive_hash}"
)
useconfigure='true'
workdir="libxkbcommon-xkbcommon-${version}"
configopts=(
    "--cross-file=${SERENITY_BUILD_DIR}/meson-cross-file.txt"
    "--prefix=${SERENITY_INSTALL_ROOT}/usr/local"
    '-Dbuildtype=release'
    '-Denable-x11=false'
    '-Denable-bash-completion=false'
    '-Denable-tools=false'
)
depends=(
    'libxml2'
    'wayland'
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
