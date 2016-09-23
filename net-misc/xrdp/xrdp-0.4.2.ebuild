# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-misc/xrdp/xrdp-0.4.2.ebuild,v 1.2 2011/06/18 01:41:44 jasiu Exp $

EAPI=4

inherit eutils multilib

DESCRIPTION="An open source remote desktop protocol(rdp) server."
HOMEPAGE="http://xrdp.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE=""

DEPEND="sys-libs/pam"
RDEPEND="${DEPEND}
	 net-misc/tigervnc"

DESTDIR="/usr/$(get_libdir)/${PN}"

src_prepare() {
	epatch "${FILESDIR}/${PN}-0.4.1-curdir.patch"

	# fix cflags, broken paths, multilib, and insecure rpath in all makefiles
	sed -i "s:CFLAGS = -Wall -O. :CFLAGS += :
		s:/usr/lib/:/usr/$(get_libdir)/:g
		s:rpath,\.:rpath,${DESTDIR}:g" `find -name Makefile`

	sed -i '/instfiles\/xrdp_control1.sh/ d' Makefile

	# as-needed patch replacement
	sed -i '/^LDFLAGS =/ {
			s: -lpthread -ldl -lscp$::
			aLIBS = -lpthread -ldl -lscp
		}
		/CC.*LDFLAGS/ s:$: $(LIBS):' sesman{,/tools}/Makefile
}

src_compile() {
	emake -j1 DESTDIR="${DESTDIR}"
}

src_install() {
	emake -j1 DESTDIRDEB="${D}" installdeb
	emake -j1 -C sesman/tools DESTDIRDEB="${D}" installdeb
	emake -j1 -C sesman/libscp DESTDIRDEB="${D}" installdeb
	dodoc design.txt readme.txt sesman/startwm.sh
	doman "${D}/usr/man/"*/*
	keepdir /var/log/${PN}
	rm -rf "${D}${DESTDIR}/startwm.sh" "${D}/usr/man"
	exeinto "${DESTDIR}"
	doexe "${FILESDIR}/startwm.sh"
	doexe "sesman/sessvc"
	newinitd "${FILESDIR}/${PN}-initd-0.4.1" ${PN}
	newconfd "${FILESDIR}/${PN}-confd" ${PN}
	sed -i "s:LIBDIR:$(get_libdir):" "${D}/etc/init.d/${PN}"
}
