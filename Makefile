# Makefile for AToM modules (for webpages, see ./html)

help:
	@./bin/help_script

SHELL=bash

#---------------------------------------------------------
# Module configuration
#
#OMFIT_VER=master
OMFIT_VER=unstable
OMFIT_GIT=git@github.com:gafusion/OMFIT-source.git
OMFIT_DIR=OMFIT-source

IPS_ATOM_VER=master
#IPS_ATOM_VER=devel
IPS_ATOM_GIT=git@github.com:ORNL-Fusion/ips-atom.git
IPS_ATOM_DIR=ips-atom

#GACODE_VER=stable
GACODE_VER=master
GACODE_GIT=git@github.com:gafusion/gacode.git
GACODE_DIR=gacode

GACODE_ADD_VER=master
GACODE_ADD_GIT=git@github.com:gafusion/gacode_add.git
GACODE_ADD_DIR=gacode_add

EPED_VER=master
EPED_GIT=git@github.com:gafusion/EPED.git
EPED_DIR=EPED-source

BOUT_VER=master
BOUT_GIT=git@github.com:boutproject/BOUT-dev.git
BOUT_DIR=BOUT

HARVEST_VER=master
HARVEST_GIT=git@github.com:gafusion/harvest_client.git
HARVEST_DIR=harvest_client

FANN_VER=master
FANN_GIT=git@github.com:libfann/fann.git
FANN_DIR=fann

OMAS_VER=master
OMAS_GIT=git@github.com:gafusion/omas.git
OMAS_DIR=omas

NEURAL_VER=master
NEURAL_GIT=git@github.com:gafusion/neural.git
NEURAL_DIR=neural

IPS_DIR=ips
IPS_SOURCE_DIR=ipsframework-code

#---------------------------------------------------------

ATOM_DIR=$(PWD)

CLONE=OMFIT CONDA3 IPS $(GACODE_DIR) $(GACODE_ADD_DIR) $(EPED_DIR) $(BOUT_DIR) $(HARVEST_DIR) $(FANN_DIR) $(NEURAL_DIR) $(OMAS_DIR) $(IPS_SOURCE_DIR)

clone: $(CLONE)

delete:
	rm -rf $(OMFIT_DIR)
	rm -rf miniconda3*
	rm -rf $(IPS_ATOM_DIR)
	rm -rf $(GACODE_DIR)
	rm -rf $(GACODE_ADD_DIR)
	rm -rf $(EPED_DIR)
	rm -rf $(BOUT_DIR)
	rm -rf $(HARVEST_DIR)
	rm -rf $(FANN_DIR)
	rm -rf $(NEURAL_DIR)
	rm -rf $(OMAS_DIR)
	rm -rf $(IPS_DIR)
	rm -rf $(IPS_SOURCE_DIR)

CONFIG:
ifndef plat
	rm -rf CONFIG
	@./bin/help_script
	exit 1
else
	@echo ""
	@echo "when this AToM installation will be completed"
	@echo "you can use it by typing at the terminal: "
	@echo ""
	@echo "  module use $(ATOM_DIR)/modules"
	@echo "  module load atom"
	@echo ""
	@echo "#%Module"                                                                   > modules/atom
	@echo "#at the termial type the following to use this AToM installation"          >> modules/atom
	@echo ""                                                                          >> modules/atom
	@echo "#  module use $(ATOM_DIR)/modules"                                         >> modules/atom
	@echo "#  module load atom"                                                       >> modules/atom
	@echo ""                                                                          >> modules/atom
	@echo "setenv ATOM_ROOT $(ATOM_DIR)"                                              >> modules/atom
	@echo "setenv GACODE_PLATFORM $(plat)"                                            >> modules/atom
	@echo "if { [ module-info mode load ] } { "                                       >> modules/atom
	@echo "  module use $(ATOM_DIR)/modules/$(plat)"                                  >> modules/atom
	@echo "}"                                                                         >> modules/atom
	@echo "module load fann"                                                          >> modules/atom
	@echo "module load `ls $(ATOM_DIR)/modules/$(plat) | grep -v '~' | tr '\n' ' '`"  >> modules/atom
	@echo "if { [ module-info mode remove ] } {"                                      >> modules/atom
	@echo "  module use $(ATOM_DIR)/modules/$(plat)"                                  >> modules/atom
	@echo "}"                                                                         >> modules/atom

	@echo "export OMFIT_ROOT=$(ATOM_DIR)/$(OMFIT_DIR)"           > CONFIG
	@echo "export OMFIT_DIR=$(ATOM_DIR)/$(OMFIT_DIR)"           >> CONFIG

	@echo "export IPS_ATOM_DIR=$(ATOM_DIR)/$(IPS_ATOM_DIR)"     >> CONFIG

	@echo "export EPED_DIR=$(ATOM_DIR)/$(EPED_DIR)"             >> CONFIG

	@echo "export BOUT_DIR=$(ATOM_DIR)/$(BOUT_DIR)"             >> CONFIG
	@echo "export BOUT_ROOT=$(ATOM_DIR)/$(BOUT_DIR)"            >> CONFIG

	@echo "export HARVEST_DIR=$(ATOM_DIR)/$(HARVEST_DIR)"       >> CONFIG
	@echo "export HARVEST_ROOT=$(ATOM_DIR)/$(HARVEST_DIR)"      >> CONFIG

	@echo "export FANN_DIR=$(ATOM_DIR)/$(FANN_DIR)"             >> CONFIG
	@echo "export FANN_ROOT=$(ATOM_DIR)/$(FANN_DIR)"            >> CONFIG

	@echo "export NEURAL_DIR=$(ATOM_DIR)/$(NEURAL_DIR)"         >> CONFIG
	@echo "export NEURAL_ROOT=$(ATOM_DIR)/$(NEURAL_DIR)"        >> CONFIG

	@echo "export OMAS_DIR=$(ATOM_DIR)/$(OMAS_DIR)"             >> CONFIG
	@echo "export OMAS_ROOT=$(ATOM_DIR)/$(OMAS_DIR)"            >> CONFIG

	@echo "export IPS_DIR=$(ATOM_DIR)/$(IPS_DIR)"               >> CONFIG
	@echo "export IPS_ROOT=$(ATOM_DIR)/$(IPS_DIR)"              >> CONFIG

	@echo "export GACODE_ROOT=$(ATOM_DIR)/$(GACODE_DIR)"        >> CONFIG
	@echo "export GACODE_PLATFORM=$(plat)"                      >> CONFIG
	@echo ". $(ATOM_DIR)/$(GACODE_DIR)/shared/bin/gacode_setup" >> CONFIG
endif

#--------------------------------------------------------------------
# Modules that need to be built/cleaned

BUILD=GACODE HARVEST EPED BOUT++ FANN IPS NEURAL

build: $(BUILD)

all: clone build

.PHONY: CONDA3
CONDA3: $(OMFIT_DIR)
	cd $(OMFIT_DIR)/install/ ; ./install-conda-3.sh -b

.PHONY: $(OMFIT_DIR)
$(OMFIT_DIR):
	@./bin/clone_script $(OMFIT_GIT)    $(OMFIT_DIR)    $(OMFIT_VER)

OMFIT: $(OMFIT_DIR)

.PHONY: $(IPS_ATOM_DIR)
$(IPS_ATOM_DIR):
	@./bin/clone_script $(IPS_ATOM_GIT) $(IPS_ATOM_DIR) $(IPS_ATOM_VER)

.PHONY: $(GACODE_DIR)
$(GACODE_DIR):
	@./bin/clone_script $(GACODE_GIT)   $(GACODE_DIR)   $(GACODE_VER)

GACODE: CONFIG NEURAL $(GACODE_DIR)
	. ./CONFIG ; cd $(GACODE_DIR) ; make

.PHONY: PYGACODE
PYGACODE: CONDA3
	../miniconda3/bin/pip install --upgrade pygacode

.PHONY: $(GACODE_ADD_DIR)
$(GACODE_ADD_DIR):
	@./bin/clone_script $(GACODE_ADD_GIT)   $(GACODE_ADD_DIR)   $(GACODE_ADD_VER)

.PHONY: $(HARVEST_DIR)
$(HARVEST_DIR):
	@./bin/clone_script $(HARVEST_GIT)  $(HARVEST_DIR)  $(HARVEST_VER)

HARVEST:CONFIG $(HARVEST_DIR)
	. ./CONFIG ; cd $(HARVEST_DIR) ; make all

.PHONY: $(EPED_DIR)
$(EPED_DIR):
	@./bin/clone_script $(EPED_GIT)  $(EPED_DIR)  $(EPED_VER)

EPED: CONFIG $(EPED_DIR)
	. ./CONFIG ; cd $(EPED_DIR) ; make

.PHONY: $(BOUT_DIR)
$(BOUT_DIR):
	@./bin/clone_script $(BOUT_GIT)  $(BOUT_DIR)  $(BOUT_VER)

BOUT++: $(BOUT_DIR)
	@cd $(BOUT_DIR); ./configure \
CPPFLAGS=" -g -fPIC " \
CC=g++ \
CXX=g++ \
MPICC=mpicxx \
MPICXX=mpicxx \
--with-lapack=/usr/lib64 \
--with-netcdf=${NETCDF_DIR} \
--with-fftw=${FFTW_DIR} \
--with-hdf5=${HDF5_DIR}/bin/h5pcc \
--with-parallelhdf5=${HDF5_DIR}/bin/h5pcc

	@cd $(BOUT_DIR); make

.PHONY: $(FANN_DIR)
$(FANN_DIR):
	@./bin/clone_script $(FANN_GIT)  $(FANN_DIR)  $(FANN_VER)

FANN: $(FANN_DIR)
	@cd $(FANN_DIR); cmake .
	@cd $(FANN_DIR); make -i; echo
	@cd $(FANN_DIR)/lib; ln -fs ../src/lib* ./

.PHONY: $(NEURAL_DIR)
$(NEURAL_DIR):
	@./bin/clone_script $(NEURAL_GIT)  $(NEURAL_DIR)  $(NEURAL_VER)

NEURAL: $(NEURAL_DIR) FANN $(GACODE_DIR)
	. ./CONFIG ; cd $(NEURAL_DIR) ; make

.PHONY: $(OMAS_DIR)
$(OMAS_DIR):
	@./bin/clone_script $(OMAS_GIT)  $(OMAS_DIR)  $(OMAS_VER)

OMAS: $(OMAS_DIR)
	@cd $(OMAS_DIR); ../miniconda3/bin/pip install --no-deps .

.PHONY: $(IPS_SOURCE_DIR)
$(IPS_SOURCE_DIR):
	svn checkout https://svn.code.sf.net/p/ipsframework/code/trunk $(IPS_SOURCE_DIR)

IPS: $(IPS_SOURCE_DIR)
	@cd $(IPS_SOURCE_DIR) && rm -rf build && mkdir build && cd build && pwd && cmake -DCMAKE_INSTALL_PREFIX:PATH=$(ATOM_DIR)/$(IPS_DIR) -DCMAKE_BUILD_TYPE=Release .. && make && make install

.PHONY: IMAS
IMAS:
	mkdir -p IMAS
	@read -p "Enter username on login.eufus.eu cluster:" user; \
	scp $$user@login.eufus.eu:~g2michal/public/imas-fc2k-latest.tar.xz ./IMAS/

clean:
	. ./CONFIG ; cd $(GACODE_DIR) ; make clean
	. ./CONFIG ; cd $(EPED_DIR) ; make clean
	. ./CONFIG ; cd $(BOUT_DIR) ; make clean
	. ./CONFIG ; cd $(HARVEST_DIR) ; make clean
	. ./CONFIG ; cd $(FANN_DIR) ; make clean
	. ./CONFIG ; cd $(IPS_SOURCE_DIR) ; rm build; mkdir build
#--------------------------------------------------------------------
