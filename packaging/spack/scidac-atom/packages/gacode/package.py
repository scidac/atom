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
from distutils.dir_util import copy_tree
from spack import *

class Gacode(Package):
    """GACODE."""

    homepage = "http://scidac.github.io/atom/introduction.html"

    version('spack', git='https://github.com/gafusion/gacode.git', branch = 'gacode_spack')

    depends_on('openmpi')
    depends_on('fftw')
    depends_on('netlib-lapack')
    depends_on('netcdf')
    depends_on('netcdf-fortran')

    parallel = False
    tags = ['atom']
   
    # Set up environment variables needed for GACODE 

    def setup_environment(self, spack_env, run_env):
        run_env.prepend_path('GACODE_ROOT',
                            self.spec.prefix)
        run_env.set('GACODE_PLATFORM', 'SPACK')

        code_names = ['shared', 'quick', 'glf23', 'le3', 'tglf', 'vgen', 'neo', 'cgyro', 'gyro', 'tgyro']
        gacode_bins = []        
        for code_name in code_names:
           gacode_bins.append(join_path(self.spec.prefix, code_name, 'bin'))
        gacode_bins = ':'.join(gacode_bins)

        run_env.prepend_path('PATH', gacode_bins)
        run_env.prepend_path('PYTHONPATH',
                            join_path(self.spec.prefix, 'python'))
        run_env.prepend_path('IDL_PATH', 
                            join_path(self.spec.prefix, 'gyro', 'vugyro'))
        

    def install(self, spec, prefix):
        env['GACODE_ROOT'] = self.stage.source_path
        env['GACODE_PLATFORM'] = 'SPACK'
        env['NETCDF_PATH'] = spec['netcdf'].prefix
        env['CC'] = spec['mpi'].mpicc
        env['CXX'] = spec['mpi'].mpicxx
        env['F77'] = spec['mpi'].mpif77
        env['FC'] = spec['mpi'].mpifc + ' -std=f2008 -I' + env['GACODE_ROOT'] + '/modules -J' + env['GACODE_ROOT'] + '/modules -g'

        make()

        # Due to interconnectedness of gacode, just copying entire tree over once built.
        copy_tree(self.stage.source_path, prefix)

