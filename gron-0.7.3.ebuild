# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

DESCRIPTION="Make JSON greppable!"
HOMEPAGE="https://github.com/rwky/gron"
SRC_URI="https://github.com/rwky/gron/releases/download/v0.7.3/gron-0.7.3.tar.gz"

LICENSE="MIT BSD-2 BSD"
SLOT="0"
KEYWORDS="amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="dev-lang/go"
S="${WORKDIR}"

go-module_set_globals

src_compile() {
	ego build -ldflags="-X=main.gronVersion=$PVR" || die "build failed"
}

src_test() {
	ego test || die "test failed"
}

src_install() {
	dobin gron
}
