#!/usr/bin/env -S bash ../.port_include.sh
port='cairo'
version='1.18.2'
CAIRO_ARCHIVE_SHA256SUM='a62b9bb42425e844cc3d6ddde043ff39dbabedd1542eba57a2eb79f85889d45a'
files=(
    "https://cairographics.org/releases/cairo-${version}.tar.xz#${CAIRO_ARCHIVE_SHA256SUM}"
)
useconfigure='true'
configopts=(
    "--cross-file=${SERENITY_BUILD_DIR}/meson-cross-file.txt"
    "--prefix=${SERENITY_INSTALL_ROOT}/usr/local"
    '-Dbuildtype=release'
    # Ensure that cairo uses existing ports
    '-Dfontconfig=enabled'
    '-Dfreetype=enabled'
    '-Dglib=enabled'
    '-Dpng=enabled'
    '-Dzlib=enabled'
)
depends=(
    'expat'
    'fontconfig'
    'freetype'
    'glib'
    'libpng'
    'pixman'
    'zlib'
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
