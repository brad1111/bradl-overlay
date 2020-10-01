# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop

DESCRIPTION="All-in-one workspace"
HOMEPAGE="https://www.notion.so"
SRC_URI="https://desktop-release.notion-static.com/Notion-${PV}.dmg -> ${P}.dmg"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
		~virtual/electron-6.1.12"
BDEPEND="
		app-arch/p7zip
		media-libs/libicns
		"
RESTRICT="mirror bindist"
S="${WORKDIR}/Notion Installer/Notion.app/Contents/Resources"

src_unpack(){
	src=${DISTDIR}/${A}
	7z x ${src}
}

src_configure(){
	cp ${FILESDIR}/* .
	icns2png -x Notion.icns
}

src_install(){
	doicon Notion_512x512x32.png
	domenu notion-bin.desktop

	insinto /opt/${PN}
	doins app.asar notion-bin
	fperms +x /opt/${PN}/notion-bin
}
