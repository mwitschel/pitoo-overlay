# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-admin/eselect-mpost/eselect-mpost-0.3.ebuild,v 1.6 2012/01/01 17:34:28 armin76 Exp $

inherit eutils

DESCRIPTION="portage snapshot module for eselect"
HOMEPAGE="http://noneyet/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
# will not work so nicely.
RDEPEND="app-admin/eselect net-misc/wget"

src_install() {
	local MODULEDIR="/usr/share/eselect/modules"
	dodir ${MODULEDIR}
	insinto ${MODULEDIR}
	newins "${FILESDIR}/portage.eselect-${PVR}" portage.eselect \
		|| die "failed to install"
}
