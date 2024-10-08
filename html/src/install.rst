Getting Started with AToM
=========================

Supported public AToM installations
-----------------------------------

.. note:: Users are highly encouraged to make use of the AToM public installations, which we maintain and support.

NERSC
"""""

We currently support an AToM public installation on the Edison supercomputer at NERSC.   The project install directory 
is under::

    /project/projectdirs/atom/atom-install-edison

Users must be part of the ``atom`` unix user group to access the NERSC public installation.  If you do not have 
an account at NERSC already, fill out `this form <https://nim.nersc.gov/nersc_account_request.php>`_ to request 
one.  Use ``atom`` for the repository name. 

General Atomics
"""""""""""""""

An AToM installation is also maintained at GA.  If you do not have GA computer access, follow the
steps for `GA cyber access <https://fusion.gat.com/global/computing>`_. 

Build AToM from source
----------------------

Contact :samp:`candy(at)fusion.gat.com` to obtain access to the `AToM GitHub repository <https://github.com/scidac/atom>`_.  You will need a GitHub account for this.  If you are running MacOS, detailed instructions on building AToM from source can be found `here. <mac_setup.html>`_

To clone the repository::

    git clone git@github.com:scidac/atom.git

This will make a `atom` directory with a `Makefile` in it::

    cd atom
    ls

The `Makefile` is capable of downloading the sources of the individual AToM components and building them.
The AToM `Makefile` leverages the `GACODE <https://github.com/gafusion/gacode>`_ build system, and as such it supports compilation of its components on several platforms::

    ALCF_BGP ALCF_CETUS BABBAGE BANACH CAOS CARVER CMODWS DELPHI
    DROP EDISON_CRAY EDISON_INTEL FT GFORTRAN_CORE2 GFORTRAN_OSX
    GFORTRAN_OSX_64 GFORTRAN_OSX_BELLI GFORTRAN_OSX_MACPORTS
    GFORTRAN_OSX_TECHX GFORTRAN_PENRYN GFORTRAN_TECHX HOPPER_CRAY
    HOPPER_INTEL HPC_ITER IFORT_CORE2 IFORT_PENRYN JAC LINDGREN
    LOHAN LOKI LOKI_SCRATCH METIUS NEWT OSX_MOUNTAINLION PACER
    PGFORTRAN_OSX PG_OPT64 PG_OPT64_FFTW PG_OPT64_MUMPS PPPL
    PPPL_PATHSCALE RANGER SATURN TITAN_CRAY VENUS

AToM components include:

* OMFIT
* IPS_ATOM
* GACODE
* HARVEST_CLIENT
* GACODE_ADD
* EPED

To make individual components (for example `GACODE` on the `VENUS` platform)::

    make GACODE ATOM_PLATFORM=VENUS

To make all of the AToM components::

    make all ATOM_PLATFORM=VENUS

The `Makefile` takes care of satisfying any interdependency between the AToM components.

Maintaining an up-to-date AToM installation
"""""""""""""""""""""""""""""""""""""""""""

The AToM `Makefile` is also capable of keeping the components up-to-date and in sync with each others' versions.
To update the AToM installation simply::

    cd atom
    git pull
    make all ATOM_PLATFORM=VENUS

Edit and build the AToM Website
-------------------------------

The `AToM documentation website <http://scidac.github.io/atom/>`_ is self-contained in the AToM repository.  To edit
the AToM documentation one simply needs to follow the aforementioned steps and edit the `.rst` files in
the `docs/` directory::

    cd atom/docs
    $EDITOR index.rst

The python packages required for buidling the AToM documentation can be installed with::

    sudo yum install sphinx
    sudo yum install python-sphinx
    sudo pip install sphinx_rtd_theme
    sudo pip install sphinxcontrib.bibtex

To build a local copy of the website::

    cd atom
    make ATOM-website

which will generate the HTML pages in the directory::

    ../atom-website/html

To see the website locally point your browser to open the `index.html` contained in that directory. For example ::

    firefox file:///...../atom-website/html/index.html

To publish the documentation online (must have write permissions to the `AToM GitHub repository <https://github.com/scidac/atom>`_)::

    cd atom
    make ATOM-online
