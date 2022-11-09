# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Convert CUE files to cdrdao's TOC format"
HOMEPAGE="http://cue2toc.sourceforge.net/"
SRC_URI="mirror://sourceforge/cue2toc/${P}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ppc64 ~sparc ~x86"

DEPEND="!!app-cdr/cdrdao"
