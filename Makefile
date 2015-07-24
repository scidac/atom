OMFIT_GIT=git@github.com:gafusion/OMFIT-source.git
OMFIT_DIR=OMFIT-source
OMFIT_VER=unstable

IPS_ATOM_GIT=git@github.com:ORNL-Fusion/ips-atom.git
IPS_ATOM_DIR=ips-atom
IPS_ATOM_VER=master

GACODE_GIT=git@github.com:gafusion/gacode.git
GACODE_DIR=gacode
GACODE_VER=master

GACODE_ADD_GIT=git@github.com:gafusion/gacode_add.git
GACODE_ADD_DIR=gacode_add
GACODE_ADD_VER=master

EPED_GIT=git@github.com:gafusion/EPED.git
EPED_DIR=EPED-source
EPED_VER=master

ALL= OMFIT IPS_ATOM GACODE GACODE_ADD EPED

GIT_CLONE = git clone -b $(3) $(1) $(2) ; cd $(2) ; git submodule init ; git submodule update
GIT_PULL  = echo $(2) ; cd $(2) ; git fetch ; git checkout $(3) ; git pull; git submodule init ; git submodule update

help:
	@echo "Usage: make all PLATFORM="
	@if [ -a "$(GACODE_DIR)" ]; then echo `ls $(GACODE_DIR)/shared/install/ | sed s/\
make\.inc\.//g | tr -s '\n' '\t' > platform`; fi;
	@cat platform
	@echo

all: $(ALL)

clean:
	rm -rf $(GACODE_DIR)
	rm -rf $(OMFIT_DIR)
	rm -rf $(GACODE_ADD_DIR)
	rm -rf $(EPED_DIR)

FORCE:

#======
# OMFIT
#======
OMFIT-source:
	$(call GIT_CLONE, $(OMFIT_GIT), $(OMFIT_DIR), $(OMFIT_VER))

OMFIT: FORCE | $(OMFIT_DIR)
	$(call GIT_PULL, $(OMFIT_GIT), $(OMFIT_DIR), $(OMFIT_VER))

#=========
# IPS_ATOM
#=========
ips-atom:
	$(call GIT_CLONE, $(IPS_ATOM_GIT), $(IPS_ATOM_DIR), $(IPS_ATOM_VER))

IPS_ATOM: FORCE | $(IPS_ATOM_DIR)
	$(call GIT_PULL, $(IPS_ATOM_GIT), $(IPS_ATOM_DIR), $(IPS_ATOM_VER))

#=======
# GACODE
#=======
gacode:
	$(call GIT_CLONE, $(GACODE_GIT), $(GACODE_DIR), $(GACODE_VER))

GACODE: FORCE | $(GACODE_DIR)
	$(call GIT_PULL, $(GACODE_GIT), $(GACODE_DIR), $(GACODE_VER))
	export GACODE_PLATFORM=$(PLATFORM); export GACODE_ROOT=`PWD`/$(GACODE_DIR);. $(GACODE_ROOT)/shared/bin/gacode_setup; cd $(GACODE_DIR); make

#===========
# GACODE_ADD
#===========
gacode_add:
	$(call GIT_CLONE, $(GACODE_ADD_GIT), $(GACODE_ADD_DIR), $(GACODE_ADD_VER))

GACODE_ADD: FORCE | $(GACODE_ADD_DIR) $(GACODE_DIR) 
	$(call GIT_PULL, $(GACODE_ADD_GIT), $(GACODE_ADD_DIR), $(GACODE_ADD_VER))

#===========
# EPED
#===========
EPED-source:
	$(call GIT_CLONE, $(EPED_GIT), $(EPED_DIR), $(EPED_VER))

EPED: FORCE | $(EPED_DIR) $(GACODE_DIR) 
	$(call GIT_PULL, $(EPED_GIT), $(EPED_DIR), $(EPED_VER))
	export GACODE_PLATFORM=$(PLATFORM); export GACODE_ROOT=`PWD`/$(GACODE_DIR);. $(GACODE_ROOT)/shared/bin/gacode_setup; cd $(EPED_DIR); make