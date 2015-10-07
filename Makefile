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

HARVEST_CLIENT_GIT=git@github.com:gafusion/harvest_client.git
HARVEST_CLIENT_DIR=harvest_client
HARVEST_CLIENT_VER=master

ATOM_WEBDIR=$(PWD)/../atom-website

ALL= OMFIT IPS_ATOM GACODE HARVEST_CLIENT GACODE_ADD EPED

GIT_CLONE = @echo ; echo ================; echo $(2) ; echo ================; git clone -b $(3) $(1) $(2) ; cd $(2) ; git submodule init ; git submodule update
GIT_PULL  = @echo ; echo ================; echo $(2) ; echo ================; cd $(2) ; git fetch ; git checkout $(3) ; git pull; git submodule init ; git submodule update

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
# AToM website
#======
$(ATOM_WEBDIR)/html:
	mkdir -p $(ATOM_WEBDIR); cd $(ATOM_WEBDIR); git clone git@github.com:scidac/atom.git -b gh-pages html

website: FORCE | $(ATOM_WEBDIR)/html
	cd docs; make html

online: FORCE | $(ATOM_WEBDIR)/html
	cd docs; make commit; make push

#======
# OMFIT
#======
$(OMFIT_DIR):
	$(call GIT_CLONE, $(OMFIT_GIT), $(OMFIT_DIR), $(OMFIT_VER))

OMFIT: FORCE | $(OMFIT_DIR)
	$(call GIT_PULL, $(OMFIT_GIT), $(OMFIT_DIR), $(OMFIT_VER))

#=========
# IPS_ATOM
#=========
$(IPS_ATOM_DIR):
	$(call GIT_CLONE, $(IPS_ATOM_GIT), $(IPS_ATOM_DIR), $(IPS_ATOM_VER))

IPS_ATOM: FORCE | $(IPS_ATOM_DIR)
	$(call GIT_PULL, $(IPS_ATOM_GIT), $(IPS_ATOM_DIR), $(IPS_ATOM_VER))

#=======
# GACODE
#=======
$(GACODE_DIR):
	$(call GIT_CLONE, $(GACODE_GIT), $(GACODE_DIR), $(GACODE_VER))

GACODE: FORCE | $(GACODE_DIR)
	$(call GIT_PULL, $(GACODE_GIT), $(GACODE_DIR), $(GACODE_VER))
	@export GACODE_PLATFORM=$(PLATFORM); export GACODE_ROOT=`pwd`/$(GACODE_DIR);. $(GACODE_DIR)/shared/bin/gacode_setup; cd $(GACODE_DIR); make

#===========
# GACODE_ADD
#===========
$(GACODE_ADD_DIR):
	$(call GIT_CLONE, $(GACODE_ADD_GIT), $(GACODE_ADD_DIR), $(GACODE_ADD_VER))

GACODE_ADD: FORCE | $(GACODE_ADD_DIR) $(GACODE_DIR) 
	$(call GIT_PULL, $(GACODE_ADD_GIT), $(GACODE_ADD_DIR), $(GACODE_ADD_VER))

#===============
# HARVEST_CLIENT
#===============
$(HARVEST_CLIENT_DIR):
	$(call GIT_CLONE, $(HARVEST_CLIENT_GIT), $(HARVEST_CLIENT_DIR), $(HARVEST_CLIENT_VER))

HARVEST_CLIENT: FORCE | $(HARVEST_CLIENT_DIR) $(GACODE_DIR)
	$(call GIT_PULL, $(HARVEST_CLIENT_GIT), $(HARVEST_CLIENT_DIR), $(HARVEST_CLIENT_VER))
	@export GACODE_PLATFORM=$(PLATFORM); export GACODE_ROOT=`pwd`/$(GACODE_DIR);. $(GACODE_DIR)/shared/bin/gacode_setup; cd $(HARVEST_CLIENT_DIR); make all

#===========
# EPED
#===========
$(EPED_DIR):
	$(call GIT_CLONE, $(EPED_GIT), $(EPED_DIR), $(EPED_VER))

EPED: FORCE | $(EPED_DIR) $(GACODE_DIR) 
	$(call GIT_PULL, $(EPED_GIT), $(EPED_DIR), $(EPED_VER))
	@export GACODE_PLATFORM=$(PLATFORM); export GACODE_ROOT=`pwd`/$(GACODE_DIR);. $(GACODE_ROOT)/shared/bin/gacode_setup; cd $(EPED_DIR); make
