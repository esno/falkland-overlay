# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit font

DESCRIPTION="Slender typeface for code, from code"
HOMEPAGE="https://be5invis.github.io/Iosevka/"
SRC_URI="https://github.com/be5invis/${PN}/releases/download/v${PV}/ttf-${PN}-term-${PV}.zip
https://github.com/be5invis/${PN}/releases/download/v${PV}/ttf-${PN}-term-curly-${PV}.zip
https://github.com/be5invis/${PN}/releases/download/v${PV}/ttf-${PN}-term-curly-slab-${PV}.zip
https://github.com/be5invis/${PN}/releases/download/v${PV}/ttf-${PN}-term-slab-${PV}.zip
https://github.com/be5invis/${PN}/releases/download/v${PV}/ttf-${PN}-term-ss01-${PV}.zip
https://github.com/be5invis/${PN}/releases/download/v${PV}/ttf-${PN}-term-ss02-${PV}.zip
https://github.com/be5invis/${PN}/releases/download/v${PV}/ttf-${PN}-term-ss03-${PV}.zip
https://github.com/be5invis/${PN}/releases/download/v${PV}/ttf-${PN}-term-ss04-${PV}.zip
https://github.com/be5invis/${PN}/releases/download/v${PV}/ttf-${PN}-term-ss05-${PV}.zip
https://github.com/be5invis/${PN}/releases/download/v${PV}/ttf-${PN}-term-ss06-${PV}.zip
https://github.com/be5invis/${PN}/releases/download/v${PV}/ttf-${PN}-term-ss07-${PV}.zip
https://github.com/be5invis/${PN}/releases/download/v${PV}/ttf-${PN}-term-ss08-${PV}.zip
https://github.com/be5invis/${PN}/releases/download/v${PV}/ttf-${PN}-term-ss09-${PV}.zip
https://github.com/be5invis/${PN}/releases/download/v${PV}/ttf-${PN}-term-ss10-${PV}.zip
https://github.com/be5invis/${PN}/releases/download/v${PV}/ttf-${PN}-term-ss11-${PV}.zip
https://github.com/be5invis/${PN}/releases/download/v${PV}/ttf-${PN}-term-ss12-${PV}.zip
https://github.com/be5invis/${PN}/releases/download/v${PV}/ttf-${PN}-term-ss13-${PV}.zip
https://github.com/be5invis/${PN}/releases/download/v${PV}/ttf-${PN}-term-ss14-${PV}.zip
"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~ppc64 ~x86"

DEPEND="app-arch/unzip"

S=${WORKDIR}
FONT_S="${S}"
FONT_SUFFIX="ttf"
