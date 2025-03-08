#!/usr/bin/env -S bash ../.port_include.sh
port='pango'
# pango 1.55 requires fontconfig 2.15 but SerenityOS uses fontconfig 2.14
version='1.54.0'
PANGO_ARCHIVE_SHA256SUM='317f366bb255282d3e64ccf95b1d57cbea8636578b199c158235e1f257e5167f'
files=(
    "https://gitlab.gnome.org/GNOME/pango/-/archive/${version}/pango-${version}.tar.gz#${PANGO_ARCHIVE_SHA256SUM}"
)
useconfigure='true'
configopts=(
    "--cross-file=${SERENITY_BUILD_DIR}/meson-cross-file.txt"
    "--prefix=${SERENITY_INSTALL_ROOT}/usr/local"
    '-Dbuildtype=release'
    # Ensure that pango uses existing ports
    '-Dcairo=enabled'
    '-Dfontconfig=enabled'
    '-Dfreetype=enabled'
)
depends=(
    'cairo'
    'expat'
    'fontconfig'
    'freetype'
    'glib'
    'harfbuzz'
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
