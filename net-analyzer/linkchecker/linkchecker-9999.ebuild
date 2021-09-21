# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..9} )
PYTHON_REQ_USE="sqlite?"

inherit bash-completion-r1 distutils-r1 optfeature

DESCRIPTION="Check websites for broken links"
HOMEPAGE="https://github.com/linkcheck/linkchecker"

if [[ "${PV}" == "9999" ]]; then
	EGIT_REPO_URI="https://github.com/linkcheck/linkchecker.git"
	inherit git-r3
else
	SRC_URI=""
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-2"
SLOT="0"
IUSE="sqlite"
# requires py2 only libs
RESTRICT="test"

RDEPEND="
	dev-python/beautifulsoup4[${PYTHON_USEDEP}]
	dev-python/dnspython[${PYTHON_USEDEP}]
	dev-python/pyxdg[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
"

python_prepare_all() {
	local PATCHES=(
		"${FILESDIR}/${PN}-9.3-bash-completion.patch"
	)

	distutils-r1_python_prepare_all
}

python_install_all() {
	local DOCS=(
		doc/changelog.txt
		doc/upgrading.txt
	)
	distutils-r1_python_install_all

	newbashcomp config/linkchecker-completion ${PN}
}

pkg_postinst() {
	optfeature "bash-completion support" dev-python/argcomplete[${PYTHON_USEDEP}]
	optfeature "Virus scanning" app-antivirus/clamav
	optfeature "Geo IP support" dev-python/geoip-python[${PYTHON_USEDEP}]
	optfeature "GNOME proxy settings support" dev-python/pygobject[${PYTHON_USEDEP}]
}
