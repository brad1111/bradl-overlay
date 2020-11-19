# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8} pypy3 )
DISTUTILS_USE_SETUPTOOLS=rdepend
inherit distutils-r1

DESCRIPTION="Unity like HUD menu for the GNOME Desktop Environment"
HOMEPAGE="https://github.com/hardpixel/gnome-hud"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="mirror"

DEPEND="
	x11-libs/gtk+:3
	x11-libs/bamf
"
BDEPEND="
	dev-python/pygobject
	dev-python/dbus-python
"

RDEPEND="
	${DEPEND}
"
