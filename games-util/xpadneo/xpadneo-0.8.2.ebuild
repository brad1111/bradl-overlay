# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit linux-mod

DESCRIPTION="Advanced Linux Driver for Xbox One Wireless Gamepad"
HOMEPAGE="https://atar-axis.github.io/xpadneo/"
SRC_URI="https://github.com/atar-axis/xpadneo/archive/v${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="udev"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/${P}/hid-xpadneo"
MODULE_NAMES="hid-xpadneo(kernel/drivers/hid:${S}:${S}/src)"

BUILD_TARGETS="modules"

src_install() {
	linux-mod_src_install

	if use udev; then
		insinto /lib/udev/rules.d
		doins etc-udev-rules.d/98-xpadneo.rules
	fi

	insinto /etc/modprobe.d
	doins etc-modprobe.d/xpadneo.conf
}
