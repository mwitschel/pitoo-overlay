EAPI=7

DESCRIPTION="pitoo base files and setup"
HOMEPAGE="https://git.witschel.zone/pitoo"
SRC_URI="http://packages.witschel.zone:5467/snapshots/pitoo-base-20210806.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="arm"
IUSE=""

DEPEND=""
# will not work so nicely.
RDEPEND="app-eselect/eselect-portage"


src_install() {

	local MODULEDIR="/etc/portage/"

	dodir "/usr/pitoo/packages"
	dodir "/usr/pitoo/distfiles"
	dodir "/usr/pitoo/snapshots"
	dodir "/etc/gbd"
	dodir "/etc/portage/"
	dodir "/etc/portage/package.env"
	dodir "/etc/portage/package.accept_keywords"
	dodir "/etc/portage/package.mask"
	dodir "/etc/portage/package.unmask"
	dodir "/etc/portage/package.use"
	dodir "/etc/portage/package.license"
	dodir "/etc/portage/sets"

	insinto "/etc/gbd"
	newins "etc/gbd/distribution.conf" "distribution.conf"

	insinto ${MODULEDIR}
	newins "make.conf" "make.conf" \
		|| die "failed to install make.conf"
	newins "make.conf.buildsys" "make.conf.buildsys" \
		|| die "failed to install make.conf.buildsys"
	newins "make.conf.binsys" "make.conf.binsys" \
		|| die "failed to install make.conf.binsys"
#	newins "make.conf.stage" "make.conf.stage" \
#		|| die "failed to install make.conf.stage"
#	newins "make.conf.hwlocal" "make.conf.hwlocal" \
#		|| die "failed to install make.conf.hwlocal"

	for d in package.use package.accept_keywords package.mask package.unmask package.license sets
	do


	    insinto ${MODULEDIR}/${d}
	    newins "${d}/pitoo" "pitoo" \
	  	|| die "failed to install files into ${d}"
	done
	}
