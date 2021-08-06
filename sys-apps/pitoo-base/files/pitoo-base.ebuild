# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

inherit eutils

DESCRIPTION="pitoo base files and setup"
HOMEPAGE="http://noneyet/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="arm"
IUSE=""

DEPEND=""
# will not work so nicely.
RDEPEND="app-eselect/eselect-pitoo"

src_install() {

    local MODULEDIR="/etc/portage/"

	dodir "/usr/pitoo/overlay"
	dodir "/usr/pitoo/packages"
	dodir "/usr/pitoo/distfiles"
	dodir "/usr/pitoo/snapshots"
	dodir "/etc/portage/"
	dodir "/etc/portage/package.env"
	dodir "/etc/portage/package.keywords"
	dodir "/etc/portage/package.mask"
	dodir "/etc/portage/package.unmask"
	dodir "/etc/portage/package.use"
	dodir "/etc/portage/package.license"
	dodir "/etc/portage/sets"

    insinto ${MODULEDIR}
	newins "${FILESDIR}/make.conf.${PVR}" "make.conf" \
		|| die "failed to install make.conf"
	newins "${FILESDIR}/make.conf.buildsys.${PVR}" "make.conf.buildsys" \
        || die "failed to install make.conf.buildsys"
    newins "${FILESDIR}/make.conf.binsys.${PVR}" "make.conf.binsys" \
        || die "failed to install make.conf.binsys"


	for d in package.use package.keywords package.mask package.unmask package.license package.env sets
	do
		for f in $(find ${FILESDIR}/${d}.${PVR}/* -printf "%f ")
		do
			insinto ${MODULEDIR}/${d}
		    newins "${FILESDIR}/${d}.${PVR}/${f}" "${f}" \
			  	|| die "failed to install files into ${d}"
		done
	done
	}

