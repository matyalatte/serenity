#!/usr/bin/env -S bash ../.port_include.sh
port='atk'
version='2.38.0'
archive_hash='ac4de2a4ef4bd5665052952fe169657e65e895c5057dffb3c2a810f6191a0c36'
files=(
    "https://download.gnome.org/sources/atk/${version%.*}/atk-${version}.tar.xz#${archive_hash}"
)
useconfigure='true'
configopts=(
    "--cross-file=${SERENITY_BUILD_DIR}/meson-cross-file.txt"
    "--prefix=${SERENITY_INSTALL_ROOT}/usr/local"
    '-Dbuildtype=release'
    '-Dintrospection=false'
)
depends=(
    'glib'
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
