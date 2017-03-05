# Makefile for AToM modules (for webpages, see ./html)

help:
	@./bin/help_script

#---------------------------------------------------------
# Module configuration
#
OMFIT_VER=master
#OMFIT_VER=unstable
OMFIT_GIT=git@github.com:gafusion/OMFIT-source.git
OMFIT_DIR=OMFIT-source

IPS_ATOM_VER=master 
#IPS_ATOM_VER=devel
IPS_ATOM_GIT=git@github.com:ORNL-Fusion/ips-atom.git
IPS_ATOM_DIR=ips-atom

GACODE_VER=master 
#GACODE_VER=stable
GACODE_GIT=git@github.com:gafusion/gacode.git
GACODE_DIR=gacode

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

#---------------------------------------------------------

clone:
#	@./bin/clone_script $(OMFIT_GIT)    $(OMFIT_DIR)    $(OMFIT_VER)
#	@./bin/clone_script $(IPS_ATOM_GIT) $(IPS_ATOM_DIR) $(IPS_ATOM_VER)
#	@./bin/clone_script $(GACODE_GIT)   $(GACODE_DIR)   $(GACODE_VER)
#	@./bin/clone_script $(EPED_GIT)     $(EPED_DIR)     $(EPED_VER)
#	@./bin/clone_script $(BOUT_GIT)     $(BOUT_DIR)     $(BOUT_VER)
#	@./bin/clone_script $(HARVEST_GIT)  $(HARVEST_DIR)  $(HARVEST_VER)
	@./bin/clone_script $(FANN_GIT)     $(FANN_DIR)     $(FANN_VER)

delete:
	rm -rf $(OMFIT_DIR)
	rm -rf $(IPS_ATOM_DIR)
	rm -rf $(GACODE_DIR)
	rm -rf $(EPED_DIR)
	rm -rf $(BOUT_DIR)
	rm -rf $(HARVEST_DIR)
	rm -rf $(FANN_DIR)

set:
ifndef plat
	rm -rf CONFIG
else
	@echo "export GACODE_PLATFORM=$(plat)" > CONFIG
	@echo "export GACODE_ROOT=$(PWD)/$(GACODE_DIR)" >> CONFIG
	@echo ". $(PWD)/$(GACODE_DIR)/shared/bin/gacode_setup" >> CONFIG
endif

#--------------------------------------------------------------------
# Modules that need to be built/cleaned

BUILD=GACODE HARVEST EPED BOUT FANN

all: $(BUILD)

GACODE:
	. ./CONFIG ; cd $(GACODE_DIR) ; make

HARVEST:
	. ./CONFIG ; cd $(HARVEST_DIR) ; make all

EPED:
	. ./CONFIG ; cd $(EPED_DIR) ; make

BOUT:
	@cd $(BOUT_DIR); ./configure
	@cd $(BOUT_DIR); make

FANN:
	@cd $(FANN_DIR); cmake .
	@cd $(FANN_DIR); make

clean:
	. ./CONFIG ; cd $(GACODE_DIR) ; make clean
	. ./CONFIG ; cd $(EPED_DIR) ; make clean
	. ./CONFIG ; cd $(BOUT_DIR) ; make clean
	. ./CONFIG ; cd $(HARVEST_DIR) ; make clean
	. ./CONFIG ; cd $(FANN_DIR) ; make clean

.PHONY: $(BUILD)
#--------------------------------------------------------------------
