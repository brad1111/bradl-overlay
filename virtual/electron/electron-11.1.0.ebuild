# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit multilib-build

DESCRIPTION="Virtual for electron"

LICENSE=""
SLOT="11"
KEYWORDS="~amd64"

BDEPEND=""
RDEPEND="|| ( ~dev-util/electron-${PV} ~dev-util/electron-bin-${PV} )"
