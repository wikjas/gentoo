# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26 ruby27 ruby30"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_BINWRAP=""

inherit ruby-fakegem

DESCRIPTION="A micro library providing objects with Publish-Subscribe capabilities"
HOMEPAGE="https://github.com/krisleech/wisper"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~hppa ~riscv ~sparc"
IUSE=""

all_ruby_prepare() {
	sed -i -e '/coverall/I s:^:#:' spec/spec_helper.rb || die
}
