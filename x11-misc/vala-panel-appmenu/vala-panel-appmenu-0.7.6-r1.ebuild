# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

#Modified from https://github.com/shimataro/portage-overlay/

EAPI=7

VALA_MIN_API_VERSION=0.24

inherit vala meson eutils gnome2-utils

DESCRIPTION="Global Menu for Vala Panel (and xfce4-panel and mate-panel)"
HOMEPAGE="https://gitlab.com/vala-panel-project/vala-panel-appmenu"
SRC_URI="${HOMEPAGE}/-/archive/${PV}/vala-panel-appmenu-${PV}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="xfce mate jayatana vala-panel"
REQUIRED_USE="|| ( vala-panel xfce mate )"

DEPEND="
	$(vala_depend)
	>=x11-libs/gtk+-3.22.0:3
	sys-devel/gettext
"
RDEPEND="
	${DEPEND}
	x11-libs/cairo
	x11-libs/gdk-pixbuf
	>=x11-libs/libwnck-3.4.7
	vala-panel? ( x11-libs/vala-panel )
	xfce? ( >=xfce-base/xfce4-panel-4.11.2 )
	mate? ( >=mate-base/mate-panel-1.20.0 )
"

#>=x11-libs/bamf-0.5.0

src_prepare(){
	default
	vala_src_prepare
}

src_configure() {
	local emesonargs=(
		-Dxfce=$(usex xfce enabled disabled)
		-Dmate=$(usex mate enabled disabled)
		-Djayatana=$(usex jayatana enabled disabled)
		-Dappmenu_gtk_module=enabled
		-Dwnck=enabled
		-Dbamf=disabled
	)
	meson_src_configure
}

pkg_preinst() {
	gnome2_schemas_savelist
}

pkg_postinst() {
	gnome2_gconf_install
	gnome2_schemas_update

	elog "for GTK+2; add the following lines into /etc/gtk-2.0/gtkrc:"
	elog "  gtk-modules=\"appmenu-gtk-module\""
	elog
	elog "for GTK+3; add the following lines into /etc/gtk-3.0/settings.ini:"
	elog "  [Settings]"
	elog "  gtk-modules=\"appmenu-gtk-module\""
	elog

	if use xfce; then
		elog "type the following lines into yor console:"
		elog "  xfconf-query -c xsettings -p /Gtk/ShellShowsMenubar -n -t bool -s true"
		elog "  xfconf-query -c xsettings -p /Gtk/ShellShowsAppmenu -n -t bool -s true"
	fi
	if use mate; then
		elog "type the following lines into yor console:"
		elog "  gsettings set org.mate.interface gtk-shell-shows-app-menu true"
		elog "  gsettings set org.mate.interface gtk-shell-shows-menubar true"
	fi
}

pkg_postrm() {
	gnome2_gconf_uninstall
	gnome2_schemas_update
}
