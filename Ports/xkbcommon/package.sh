#!/usr/bin/env -S bash ../.port_include.sh
port='xkbcommon'
version='1.9.2'
archive_hash='8d68a8b45796f34f7cace357b9f89b8c92b158557274fef5889b03648b55fe59'
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
)

configure() {
    run meson setup build "${configopts[@]}"
}

build() {
    run ninja -C build
}

install() {
    run ninja -C build install
}
