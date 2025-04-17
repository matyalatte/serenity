#!/usr/bin/env -S bash ../.port_include.sh
port='wayland-protocols'
version='1.43'
useconfigure='true'
configopts=(
    "--buildtype=release"
    "--cross-file=${SERENITY_BUILD_DIR}/meson-cross-file.txt"
    '-Dtests=false'
    # We use /usr/local/lib since pkgconfig does not search /usr/local/share
    '--datadir=lib'
)
depends=(
    'wayland'
)
archive_hash='ba3c3425dd27c57b5291e93dba97be12479601e00bcab24d26471948cb643653'
files=(
    "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/${version}/downloads/wayland-protocols-${version}.tar.xz#${archive_hash}"
)

configure() {
    # TODO: Figure out why GCC doesn't autodetect that libgcc_s is needed.
    if [ "${SERENITY_TOOLCHAIN}" = "GNU" ]; then
        export LDFLAGS="-lgcc_s"
    fi

    run meson build "${configopts[@]}"
}

build() {
    run ninja -C build
}

install() {
    export DESTDIR="${SERENITY_INSTALL_ROOT}"
    run meson install -C build
}
