# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-2

DESCRIPTION="initram generation util"
HOMEPAGE="http://fifo.sh"

EGIT_REPO_URI="https://github.com/esno/mkinitram.git"

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

src_install() {
  dodir /etc
  dodir /usr/share/mkinitram

  insinto /etc
  doins ${S}/src/initram.cfg

  insinto /usr/share/mkinitram
  doins ${S}/src/init.sh

  dosbin ${S}/mkinitram.sh
}
