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

GACODE_VER=stable
#GACODE_VER=master
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

#---------------------------------------------------------

clone: $(OMFIT_DIR) $(IPS_ATOM_DIR) $(GACODE_DIR) $(GACODE_ADD_DIR) $(EPED_DIR) $(BOUT_DIR) $(HARVEST_DIR) $(FANN_DIR)

delete:
	rm -rf $(OMFIT_DIR)
	rm -rf $(IPS_ATOM_DIR)
	rm -rf $(GACODE_DIR)
	rm -rf $(GACODE_ADD_DIR)
	rm -rf $(EPED_DIR)
	rm -rf $(BOUT_DIR)
	rm -rf $(HARVEST_DIR)
	rm -rf $(FANN_DIR)

set:
ifndef plat
	rm -rf CONFIG
else
	@echo ""
	@echo "when this AToM installation will be completed"
	@echo "you can use it by typing at the terminal: "
	@echo ""
	@echo "  module use $(PWD)/modules"
	@echo "  module load atom"
	@echo ""
	@echo "#%Module"                                        > modules/atom
	@echo "#at the termial type the following to use this AToM installation"      >> modules/atom
	@echo ""                                               >> modules/atom
	@echo "#  module use $(PWD)/modules"                   >> modules/atom
	@echo "#  module load atom"                            >> modules/atom
	@echo ""                                               >> modules/atom
	@echo "setenv ATOM_ROOT $(PWD)"                        >> modules/atom
	@echo "setenv GACODE_PLATFORM $(plat)"                 >> modules/atom
	@echo "module use $(PWD)/modules/$(plat)"              >> modules/atom
	@echo "module load `ls $(PWD)/modules/$(plat)`"        >> modules/atom

	@echo "export OMFIT_ROOT=$(PWD)/$(OMFIT_DIR)"           > CONFIG
	@echo "export OMFIT_DIR=$(PWD)/$(OMFIT_DIR)"           >> CONFIG

	@echo "export IPS_ATOM_DIR=$(PWD)/$(IPS_ATOM_DIR)"     >> CONFIG

	@echo "export EPED_DIR=$(PWD)/$(EPED_DIR)"             >> CONFIG

	@echo "export BOUT_DIR=$(PWD)/$(BOUT_DIR)"             >> CONFIG
	@echo "export BOUT_ROOT=$(PWD)/$(BOUT_DIR)"            >> CONFIG

	@echo "export HARVEST_DIR=$(PWD)/$(HARVEST_DIR)"       >> CONFIG
	@echo "export HARVEST_ROOT=$(PWD)/$(HARVEST_DIR)"      >> CONFIG

	@echo "export FANN_DIR=$(PWD)/$(FANN_DIR)"             >> CONFIG
	@echo "export FANN_ROOT=$(PWD)/$(FANN_DIR)"            >> CONFIG

	@echo "export GACODE_ROOT=$(PWD)/$(GACODE_DIR)"        >> CONFIG
	@echo "export GACODE_PLATFORM=$(plat)"                 >> CONFIG
	@echo ". $(PWD)/$(GACODE_DIR)/shared/bin/gacode_setup" >> CONFIG
endif

#--------------------------------------------------------------------
# Modules that need to be built/cleaned

BUILD=GACODE HARVEST EPED BOUT++ FANN

build: $(BUILD)

all: clone build

$(OMFIT_DIR):
	@./bin/clone_script $(OMFIT_GIT)    $(OMFIT_DIR)    $(OMFIT_VER)

OMFIT: $(OMFIT_DIR)
	@echo

IPS: $(IPS_ATOM_DIR)
	@echo

$(IPS_ATOM_DIR):
	@./bin/clone_script $(IPS_ATOM_GIT) $(IPS_ATOM_DIR) $(IPS_ATOM_VER)

$(GACODE_DIR):
	@./bin/clone_script $(GACODE_GIT)   $(GACODE_DIR)   $(GACODE_VER)

GACODE: $(GACODE_DIR) FANN
	. ./CONFIG ; cd $(GACODE_DIR) ; make some

$(GACODE_ADD_DIR):
	@./bin/clone_script $(GACODE_ADD_GIT)   $(GACODE_ADD_DIR)   $(GACODE_ADD_VER)

$(HARVEST_DIR):
	@./bin/clone_script $(HARVEST_GIT)  $(HARVEST_DIR)  $(HARVEST_VER)

HARVEST:$(HARVEST_DIR)
	. ./CONFIG ; cd $(HARVEST_DIR) ; make all

$(EPED_DIR):
	@./bin/clone_script $(EPED_GIT)  $(EPED_DIR)  $(EPED_VER)

EPED: $(EPED_DIR)
	. ./CONFIG ; cd $(EPED_DIR) ; make

$(BOUT_DIR):
	@./bin/clone_script $(BOUT_GIT)  $(BOUT_DIR)  $(BOUT_VER)

BOUT++: $(BOUT_DIR)
	@cd $(BOUT_DIR); ./configure
	@cd $(BOUT_DIR); make

$(FANN_DIR):
	@./bin/clone_script $(FANN_GIT)  $(FANN_DIR)  $(FANN_VER)

FANN: $(FANN_DIR)
	@cd $(FANN_DIR); cmake .
	@cd $(FANN_DIR); make -i; echo
	@cd $(FANN_DIR)/lib; ln -fs ../src/lib* ./

clean:
	. ./CONFIG ; cd $(GACODE_DIR) ; make clean
	. ./CONFIG ; cd $(EPED_DIR) ; make clean
	. ./CONFIG ; cd $(BOUT_DIR) ; make clean
	. ./CONFIG ; cd $(HARVEST_DIR) ; make clean
	. ./CONFIG ; cd $(FANN_DIR) ; make clean

.PHONY: $(BUILD)
#--------------------------------------------------------------------
