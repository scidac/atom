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
# This is a template package file for Spack.  We've put "FIXME"
# next to all the things you'll want to change. Once you've handled
# them, you can save this file and test your package like this:
#
#     spack install ga-harvest
#
# You can edit this file again by typing:
#
#     spack edit ga-harvest
#
# See the Spack documentation for more information on packaging.
# If you submit this package back to Spack as a pull request,
# please first remove this boilerplate and all FIXME comments.
#
from distutils.dir_util import copy_tree
from spack import *


class GaHarvest(Package):
    """ The harvest project aims at providing a convenient and scalable way to log metadata and store data for fusion applications."""

    homepage = "http://scidac.github.io/atom/introduction.html"

    version('harvest', git='https://github.com/gafusion/harvest_client.git', branch = 'master')
    parallel = False

    tags = ['atom']

    # depends_on('foo')

    def install(self, spec, prefix):
        env['GACODE_PLATFORM'] = 'SPACK'
        make()

        # For now, copy everything over.  We will probably want to organize this into /lib in the future, however.
        copy_tree(self.stage.source_path, prefix) 
