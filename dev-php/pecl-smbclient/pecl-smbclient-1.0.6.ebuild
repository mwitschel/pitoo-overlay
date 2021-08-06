# Matthias Witschel
# derived from pecl-radius ebuild
#
# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PHP_EXT_NAME="smbclient"
PHP_EXT_INI="yes"
PHP_EXT_ZENDEXT="no"

USE_PHP="php7-3 php7-4"
PHP_EXT_PECL_FILENAME="${PN/pecl-/}-${PV/_beta/b}.tgz"
PHP_EXT_S="${WORKDIR}/${PHP_EXT_PECL_FILENAME%.tgz}"

inherit php-ext-pecl-r3

KEYWORDS="~arm"

DESCRIPTION="Provides support for CIFS/SMB via samba's libsmbclient libary"
LICENSE="BSD"
SLOT="0"
IUSE="examples"

S="${PHP_EXT_S}"

DEPEND="net-fs/samba"

RDEPEND="${DEPEND}
	php_targets_php7-3? (
				dev-lang/php:7.3
				)
	php_targets_php7-4? (
				dev-lang/php:7.4
				)
"
