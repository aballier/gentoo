# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
PYTHON_COMPAT=( python{2_7,3_{4,5}} )

inherit distutils-r1

DESCRIPTION="Merge a series of JSON documents."
HOMEPAGE="https://github.com/omergertel/jsonmerge/ https://pypi.python.org/pypi/jsonmerge/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

REPEND="dev-python/jsonschema[${PYTHON_USEDEP}]"
DEPEND="${REPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"

python_test() {
	PYTHONPATH="${PWD}" python -m unittest \
		$(find tests -name 'test_*.py' | LC_ALL=C sort | sed -e 's:/:.:' -e 's:.py$::') || die
}
