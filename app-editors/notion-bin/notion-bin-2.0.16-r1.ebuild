# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop

DESCRIPTION="All-in-one workspace"
HOMEPAGE="https://www.notion.so"
SRC_URI="https://desktop-release.notion-static.com/Notion%20Setup%20${PV}.exe -> ${P}.exe"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
		>=virtual/electron-11.0.0:11"
BDEPEND="
		app-arch/p7zip
		net-libs/nodejs
		media-gfx/imagemagick
		"
RESTRICT="mirror bindist"
tmp2="${WORKDIR}/tmp2"
S="${tmp2}/resources/app"

src_unpack(){
	nsis_exe="${DISTDIR}/${A}"
	tmp1="${WORKDIR}/tmp1"
	7z x "${nsis_exe}" -o"${tmp1}"
	app_64_7z="${tmp1}/\$PLUGINSDIR/app-64.7z"
	7z x "${app_64_7z}" -o"${tmp2}"
}

src_configure(){
	tmp3="${WORKDIR}/tmp3"
	mkdir -p "${tmp3}"
	convert "${S}/icon.ico[0]" "${tmp3}/notion-bin.png"

	# patch sqliteServerEnabled in preload out
	einfo "Patching preload to disable sqliteServer"
	sed -i "s/sqliteServerEnabled: .*,/sqliteServerEnabled: false,/g" renderer/preload.js
}

#src_compile(){

#	# move notion-intl into node_modules
#	rm app/node_modules/notion-intl
#	cp app/shared/notion-intl/ node_modules/ -r

#}

src_install(){
	doicon "${tmp3}/notion-bin.png"
	domenu "${FILESDIR}/notion-bin.desktop"

	insinto /opt/${PN}
	doins "${FILESDIR}/notion-bin"
	doins -r *
	fperms +x /opt/${PN}/notion-bin
}
