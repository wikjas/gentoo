# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit cmake

CommitId=63058eff77e11aa15bf531df5dd34395ec3017c8
DESCRIPTION="Division via fixed-point multiplication by inverse"
HOMEPAGE="https://github.com/Maratyszcza/FXdiv/"
SRC_URI="https://github.com/Maratyszcza/${PN}/archive/${CommitId}.tar.gz
	-> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="test? ( dev-cpp/gtest )"
RESTRICT="!test? ( test )"

S="${WORKDIR}"/${PN}-${CommitId}

PATCHES=(
	"${FILESDIR}"/${P}-gentoo.patch
)

src_configure() {
	local mycmakeargs=(
		-DFXDIV_BUILD_BENCHMARKS=OFF
		-DFXDIV_BUILD_TESTS=$(usex test ON OFF)
	)
	cmake_src_configure
}
