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
#     spack install omfit
#
# You can edit this file again by typing:
#
#     spack edit omfit
from spack import *
from distutils.dir_util import copy_tree

class Omfit(Package):
    """OMFIT is an integrated modeling and experimental data analysis software for magnetically confined thermonuclear fusion experiments."""

    homepage = "https://omfit.io"
    version('0.24.4', git='https://github.com/gafusion/OMFIT-source.git', tag='v0.24.4')

    depends_on('astropy') 
    depends_on('fftw') 
    depends_on('py-sphinxcontrib-bibtex')  # Is this the same as bibtexparser?
    depends_on('curl')
    depends_on('py-dask')
    depends_on('py-dill')
    depends_on('py-emcee')
    depends_on('git')
    depends_on('py-h5py')
    depends_on('netcdf')
    depends_on('py-netcdf4')
    depends_on('py-lmfit')
    depends_on('py-matplotlib')
    depends_on('py-numpy')
    depends_on('omas')
    depends_on('postgresql')
    depends_on('py-psutil')
    depends_on('py-pytables')
    depends_on('py-scipy')
    depends_on('py-seaborn')
    depends_on('py-sphinx')
    depends_on('py-sphinx-bootstrap-theme')
    depends_on('tk')
    depends_on('unixodbc')
    depends_on('wget')
    depends_on('py-xarray')
    depends_on('zlib')

    
    tags = ['atomshell']

    def install(self, spec, prefix):
        # For now, copy everything over.
        copy_tree(self.stage.source_path, prefix)
