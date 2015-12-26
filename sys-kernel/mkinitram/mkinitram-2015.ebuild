# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="initram generation util"
HOMEPAGE="http://fifo.sh"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="
  ${DEPEND}
  app-arch/cpio
  sys-fs/cryptsetup
  sys-fs/lvm2
  "

S=${WORKDIR}

src_install() {
  dodir /etc
  dodir /usr/share/mkinitram

  insinto /etc
  doins ${FILESDIR}/initram.cfg

  insinto /usr/share/mkinitram
  doins ${FILESDIR}/init.sh

  dosbin ${FILESDIR}/mkinitram.sh
}
