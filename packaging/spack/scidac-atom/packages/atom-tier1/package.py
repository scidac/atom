##############################################################################
# Copyright (c) 2013-2017, Lawrence Livermore National Security, LLC.
# Produced at the Lawrence Livermore National Laboratory.
#
# This file is part of Spack.
# Created by Todd Gamblin, tgamblin@llnl.gov, All rights reserved.
# LLNL-CODE-647188
#
# For details, see https://github.com/spack/spack
# Please also see the NOTICE and LICENSE files for our notice and the LGPL.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License (as
# published by the Free Software Foundation) version 2.1, February 1999.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the IMPLIED WARRANTY OF
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the terms and
# conditions of the GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
##############################################################################
#
#     spack install atom-tier1
#
# You can edit this file again by typing:
#
#     spack edit atom-tier1
#
#
from spack import *
import os

class AtomTier1(Package):
    """ AToM meta-package to install all of AToM available with Spack"""

    homepage = "http://scidac.github.io/atom/introduction.html"

    # Spack wants something to download.  I don't need a 
    # Checksum if we use git.
    # Later we can point this to files describing a 
    # Tour of AToM
    version('0.1', git='https://github.com/scidac/atom.git' )

    depends_on('gacode')
    depends_on('ga-harvest')
    depends_on('py-omas')
    tags = ['atom']

    def install(self, spec, prefix):
        # As this is a meta-package, just touch a file at the 
        # Prefix to indicate it was installed.
        fname = join_path(prefix,'installed')
        with open(fname, 'a'):
            os.utime(fname, None)
            
