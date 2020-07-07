# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit meson

DESCRIPTION="Materia is a Material Design theme for GNOME/GTK based desktop environments."
HOMEPAGE="https://github.com/nana-4/materia-theme"
SRC_URI="https://github.com/nana-4/materia-theme/archive/v${PV}.tar.gz"
LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~ppc ~ppc64 ~x86"
IUSE="appindicator gnome gtk2 gtk3 xfce cinnamon"
REQUIRED_USE="
	|| ( appindicator gnome gtk2 gtk3 xfce cinnamon )
"

RDEPEND="
	>=x11-libs/gtk+-3.20:0
	>=x11-themes/gtk-engines-murrine-0.90
"
DEPEND="
	${RDEPEND}
	dev-lang/sassc
"
S=${WORKDIR}/${P^}

src_install() {
	meson_src_install

	pushd "${ED}"/usr/share/themes > /dev/null || die
	use appindicator || { rm -r ${PN^}*/unity || die; }
	use gnome || { rm -r ${PN^}*/metacity-1 || die; }
	use gtk2 || { rm -r ${PN^}*/gtk-2.0 || die; }
	use gtk3 || { rm -r ${PN^}*/gtk-3.0 || die; }
	use xfce || { rm -r ${PN^}*/xfce* ${PN^}*/xfwm4* || die; }
	use cinnamon || { rm -r ${PN^}*/cinnamon || die; }
	rm -r ${PN^}*/chrome ${PN^}*/plank
	popd > /dev/null || die
}

