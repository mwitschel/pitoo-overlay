# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/virtual/linux-sources/linux-sources-1.ebuild,v 1.3 2013/09/05 05:47:36 vapier Exp $

EAPI=2

DESCRIPTION="Virtual for Linux kernel sources"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="arm"
IUSE="firmware"

DEPEND="firmware? ( sys-kernel/linux-firmware )"
RDEPEND="|| (
		sys-kernel/raspberrypi-sources
	)"
