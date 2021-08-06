# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-admin/eselect-mpost/eselect-mpost-0.3.ebuild,v 1.6 2012/01/01 17:34:28 armin76 Exp $

EAPI=7

DESCRIPTION="portage and overlay snapshot module for eselect"
HOMEPAGE="https://git.witschel.zone/gbd/eselect-portage"
SRC_URI="https://git.witschel.zone/gbd/eselect-portage/-/archive/20210714/eselect-portage-20210806.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="arm"
IUSE=""

DEPEND=""
# will not work so nicely.
RDEPEND="app-admin/eselect net-misc/wget !app-admin/eselect-pitoo !app-eselect/eselect-pitoo"

src_install() {
        insinto /usr/share/eselect/modules
        doins portage.eselect
        exeinto /etc/local.d
        doexe portage+overlay.start
}

