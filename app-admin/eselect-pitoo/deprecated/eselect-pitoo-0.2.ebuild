# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-admin/eselect-mpost/eselect-mpost-0.3.ebuild,v 1.6 2012/01/01 17:34:28 armin76 Exp $

inherit eutils

DESCRIPTION="pitoo snapshot module for eselect"
HOMEPAGE="http://noneyet/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="arm"
IUSE=""

DEPEND=""
# will not work so nicely.
RDEPEND=">=app-admin/eselect-1.3.4 >=net-misc/curl-7.30.0"

src_install() {
	local MODULEDIR="/usr/share/eselect/modules"
	dodir ${MODULEDIR}
	insinto ${MODULEDIR}
	newins "${FILESDIR}/pitoo.eselect-${PVR}" pitoo.eselect \
		|| die "failed to install"
}
