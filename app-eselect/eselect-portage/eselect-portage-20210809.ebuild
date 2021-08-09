EAPI=7

DESCRIPTION="portage and overlay snapshot module for eselect"
HOMEPAGE="https://git.witschel.zone/gbd/eselect-portage"
SRC_URI="https://git.witschel.zone/gbd/eselect-portage/-/archive/${PV}/eselect-portage-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
# will not work so nicely.
RDEPEND="app-admin/eselect net-misc/wget !!app-admin/eselect-portage"

src_install() {
        insinto /usr/share/eselect/modules
        doins portage.eselect
        exeinto /etc/local.d
        doexe portage+overlay.start
}

