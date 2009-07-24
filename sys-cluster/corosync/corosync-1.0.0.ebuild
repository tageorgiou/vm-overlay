# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="A cluster engine"
HOMEPAGE="http://www.corosync.org/"
SRC_URI="ftp://ftp%40corosync%2Eorg:downloads@corosync.org/downloads/corosync-1.0.0/corosync-1.0.0.tar.gz"

LICENSE="BSD public-domain"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""

DEPEND="virtual/libc"
RDEPEND=""

src_unpack() {
	unpack ${A}
	cd "${S}"
}

src_compile() {
	econf --disable-nss
	emake -j1
}

src_install() {
	emake DESTDIR="${D}" install
	newinitd "${FILESDIR}"/corosync.initd corosync
}
