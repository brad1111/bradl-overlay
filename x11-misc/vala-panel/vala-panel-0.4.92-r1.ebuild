# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

#Modified from https://github.com/shimataro/portage-overlay/

EAPI=7

VALA_MIN_API_VERSION=0.24

inherit vala meson eutils gnome2-utils

DESCRIPTION="Vala rewrite of simple panel"
HOMEPAGE="https://gitlab.com/vala-panel-project/vala-panel"
SRC_URI="${HOMEPAGE}/-/archive/${PV}/vala-panel-${PV}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+wnck +drawing"
RESTRICT="mirror"

DEPEND="
	$(vala_depend)
	>=x11-libs/gtk+-3.22.0:3
	sys-devel/gettext
"
RDEPEND="
	${DEPEND}
	x11-libs/cairo
	x11-libs/gdk-pixbuf
	wnck? ( >=x11-libs/libwnck-3.4.7 )
"

src_prepare(){
	default
	vala_src_prepare
}

src_configure() {
	local emesonargs=(
		-Dwnck=$(usex wnck enabled disabled)
		-Ddrawing=$(usex drawing true false)
	)
	meson_src_configure
}

pkg_preinst() {
	gnome2_schemas_savelist
}

pkg_postinst() {
	gnome2_gconf_install
	gnome2_schemas_update
	xdg_icon_cache_update
}

pkg_postrm() {
	gnome2_gconf_uninstall
	gnome2_schemas_update
	xdg_icon_cache_update
}
