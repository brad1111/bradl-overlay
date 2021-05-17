# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7,8,9} )
inherit python-single-r1

DESCRIPTION="Script that boots to Windows"
HOMEPAGE="https://gist.github.com/Darkhogg/82a651f40f835196df3b1bd1362f5b8c"
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

#DEPEND=""
RDEPEND="${PYTHON_DEPS}
sys-fs/e2fsprogs
"
BDEPEND=""

S="${FILESDIR}"

src_install(){
	python_newscript boot-windows.py boot-windows
}
