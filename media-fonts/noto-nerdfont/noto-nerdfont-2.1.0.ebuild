# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit font

DESCRIPTION="Patched nerdfont of noto"
HOMEPAGE="https://www.google.com/get/noto/ https://github.com/googlei18n/noto-fonts https://www.nerdfonts.com/"
SRC_URI="https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/Noto.zip"

LICENSE="OFL-1.1 MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
RESTRICT="mirror"
S="${WORKDIR}"
FONT_S="${S}"
FONT_SUFFIX="ttf"
FONT_PN="Noto"

# From https://github.com/szorfein/ninjatools
src_prepare() {
	# Removing windows comptatible fonts
	$(find "${S}" -iname '*.ttf' -iname '*Windows Compatible.ttf' -exec rm {} +)
	default
}
