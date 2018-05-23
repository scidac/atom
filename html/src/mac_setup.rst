Complete MacOS install of AToM with MacPorts
============================================

This guide will provide step-by-step instructions for installing AToM Tier 1 on a fresh MacOS system.  

Prerequisites
-------------

Adminstrator access on your Mac is required for an install with this method. 

Most instructions require the mac Terminal app to be open so commands can be input. 

In addition, for a full install, a `github <https://github.com>`_ account is required along with access to the following git repositories:

1. https://github.com/gafusion/OMFIT-source
2. https://github.com/ORNL-Fusion/ips-atom
3. https://github.com/gafusion/gacode
4. https://github.com/gafusion/gacode_add
5. https://github.com/gafusion/EPED
6. https://github.com/boutproject/BOUT-dev
7. https://github.com/gafusion/harvest_client
8. https://github.com/libfann/fann
9. https://github.com/gafusion/omas
10. https://github.com/gafusion/neural

Any steps you have completed previously can be skipped. 

Install
-------

1. Install Developer command line tools type ::

    xcode-select --install

   Then click the "Install" button in the dialog box that appears.

   Then agree to the license agreement.

2. Generate SSH keys if you do not currently have them. This is used to authenticate with github later. 

    To check if you have existing ssh keys ::

        ls ~/.ssh/id_rsa.pub 

    This will return "No such file or directory" if it does NOT exist.  If it exists, skip to step 3, if not, generate your ssh keys ::
    
        ssh-keygen -t rsa -b 4096

    Keep the default location to save the key by pressing enter.

    Enter a passphrase.  You will need this passphrase every time you access a github repo.  If you do not enter a passphrase anyone who has access to your private key will be able to impersonate your computer. 

3. Add public ssh key to github.  Instructions found `here <https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/>`_

4. Setup git email and name ::
    
    git config --global user.name "Your Name"
    git config --global user.email "your_email@example.com"

5. Install Mac Ports.  Instructions found `here <https://www.macports.org/install.php>`_

6. In order to use any X11 enabled tools, install X-Quartz.  It can be found `here <https://www.xquartz.org/>`_ . After installing, it will require logging out of your computer and logging back in before it can be used. (Apple menu -> Log Out)

7. In the terminal, navigate to where you would like AToM installed and clone the git repository. ::

    git clone git@github.com:scidac/atom.git

   If it asks if you want to continue connecting, say yes.

8. Install and configure the prerequisites with Mac Ports.  Enter your computer's password (not the SSH key passphrase) when promped and enter 'Y' when prompted to confirm installs.  Some of these installs (like openmpi) may take a while. ::

    sudo port install cmake
    sudo port install openmpi
    sudo port select --set mpi openmpi-mp-fortran
    sudo port install fftw-3
    sudo port install fann
    sudo port install netcdf
    sudo port install netcdf-fortran
    sudo port install netcdf-cxx
    sudo port install doxygen

9. Export compiler locations for cmake (Exact names may vary.  If you close your terminal, you may have to do this step again) ::

    export FC=/opt/local/bin/gfortran-mp-7 
    export CC=/opt/local/bin/gcc-mp-7
    export CXX=/opt/local/bin/g++-mp-7

10. Configure and make AToM.  Enter your ssh key passphrase when prompted (Not your computer password) ::

    cd atom
    make set plat=GFORTRAN_OSX_MACPORTS
    make all ATOM_PLATFORM=GFORTRAN_OSX_MACPORTS

11. Add environment variables to your .profile so tools are available in your next terminal session :: 

12. Install OMFIT prerequisites.  Answer 'Y' to any prompts asking if you want to install and enter computer's password when prompted.  Assuming you are still in the atom directory, type ::
    cd OMFIT-source/install/ports
    ./install.sh

   If you run into problems with Mac Ports here, you may need to switch to the unstable branch. (From within the OMFIT-source directory) ::

    git checkout unstable
    cd OMFIT-source/install/ports
    ./install.sh

.. ~~~~
.. Tour
.. ~~~~

.. - OMFIT : Getting started guides can be found `here <https://gafusion.github.io/OMFIT-source/usage.html>`_  To launch OMFIT and explore ::

..    omfit
