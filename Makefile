# Makefile for AToM modules.  
# For webpages, see ./html

ATOM_VERSION = stable # or devel
ifeq ($(strip $(ATOM_VERSION)),stable)
        OMFIT_VER=master # master & unstable
        IPS_ATOM_VER=master # master & devel
        GACODE_VER=stable # stable & master
else
        OMFIT_VER=unstable # master & unstable
        IPS_ATOM_VER=devel # master & devel
        GACODE_VER=master # stable & master
endif
EPED_VER=master # master
HARVEST_CLIENT_VER=master # master
ATOM_DOC_VER=master # master

OMFIT_GIT=git@github.com:gafusion/OMFIT-source.git
OMFIT_DIR=OMFIT-source
OMFIT_WEBDIR=OMFIT-docs

IPS_ATOM_GIT=git@github.com:ORNL-Fusion/ips-atom.git
IPS_ATOM_DIR=ips-atom

GACODE_GIT=git@github.com:gafusion/gacode.git
GACODE_DIR=gacode

EPED_GIT=git@github.com:gafusion/EPED.git
EPED_DIR=EPED-source

BOUT++_GIT=git@github.com:boutproject/BOUT-dev.git
BOUT++_DIR=BOUT
BOUT++_VER=master #master

HARVEST_CLIENT_GIT=git@github.com:gafusion/harvest_client.git
HARVEST_CLIENT_DIR=harvest_client

ATOM_GIT=git@github.com:scidac/atom.git

ALL= OMFIT GACODE IPS_ATOM HARVEST_CLIENT EPED BOUT++

GIT_CLONE   = @echo ; \
              echo ================; \
              echo $(2) [clone] ; \
              echo ================; \
              git clone -b $(3) $(1) $(2) ; \
              cd $(2) ; \
              git submodule update --init --recursive
GIT_PULL    = @echo ; \
              echo ================; \
              echo $(2) [pull]  ; \
              echo ================; \
              cd $(2) ; \
              git fetch ; \
              git checkout $(3) ; \
              git pull; \
              git submodule update --init --recursive
GACODE_MAKE = @echo ; \
              echo ================; \
              echo $(1) [make]  ; \
              echo ================; \
              bash -c "export GACODE_PLATFORM=$(ATOM_PLATFORM); \
                export GACODE_ROOT=`pwd`/$(GACODE_DIR); \
                cd $(1); \
                . $(GACODE_ROOT)/shared/bin/gacode_setup; \
                $(2)"


help:
	@echo "Usage: make ... ATOM_PLATFORM=..."
	@echo
	@echo "Supported platforms:"
	@if [ -a "$(GACODE_DIR)" ]; then echo `ls $(GACODE_DIR)/shared/install/ | sed s/\
make\.inc\.//g | tr -s '\n' '\t' > platform`; fi;
	@cat platform
	@echo
	@echo
	@echo "Supported make options:"
	@echo
	@echo "all ATOM-website ATOM-online ATOM_DOC OMFIT OMFIT-website OMFIT-online IPS_ATOM GACODE GACODE_ADD HARVEST_CLIENT EPED BOUT"

all: $(ALL)

delete_all:
	rm -rf $(GACODE_DIR)
	rm -rf $(OMFIT_DIR)
	rm -rf $(EPED_DIR)
	rm -rf $(HARVEST_CLIENT_DIR)
	rm -rf $(BOUT++_DIR)

FORCE:

#======
# OMFIT
#======
$(OMFIT_DIR):
	$(call GIT_CLONE, $(OMFIT_GIT), $(OMFIT_DIR), $(OMFIT_VER))

OMFIT: FORCE | $(OMFIT_DIR)
	$(call GIT_PULL, $(OMFIT_GIT), $(OMFIT_DIR), $(OMFIT_VER))

$(OMFIT_WEBDIR)/html:
	mkdir -p $(OMFIT_WEBDIR); cd $(OMFIT_WEBDIR); git clone $(OMFIT_GIT) -b gh-pages html

OMFIT-website: FORCE | $(OMFIT_WEBDIR)/html $(OMFIT_DIR)
	cd $(OMFIT_DIR)/docs; make html

OMFIT-online: FORCE | $(OMFIT_WEBDIR)/html $(OMFIT_DIR)
	cd $(OMFIT_DIR)/docs; make commit; make push

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
	$(call GACODE_MAKE, $(GACODE_DIR), make)

#===============
# HARVEST_CLIENT
#===============
$(HARVEST_CLIENT_DIR):
	$(call GIT_CLONE, $(HARVEST_CLIENT_GIT), $(HARVEST_CLIENT_DIR), $(HARVEST_CLIENT_VER))

HARVEST_CLIENT: FORCE | $(HARVEST_CLIENT_DIR) $(GACODE_DIR)
	$(call GIT_PULL, $(HARVEST_CLIENT_GIT), $(HARVEST_CLIENT_DIR), $(HARVEST_CLIENT_VER))
	$(call GACODE_MAKE, $(HARVEST_CLIENT_DIR), make all)

#===========
# EPED
#===========
$(EPED_DIR):
	$(call GIT_CLONE, $(EPED_GIT), $(EPED_DIR), $(EPED_VER))

EPED: FORCE | $(EPED_DIR) $(GACODE_DIR)
	$(call GIT_PULL, $(EPED_GIT), $(EPED_DIR), $(EPED_VER))
	$(call GACODE_MAKE, $(EPED_DIR), make)

#=========
# BOUT++
#=========
$(BOUT++_DIR):
	$(call GIT_CLONE, $(BOUT++_GIT), $(BOUT++_DIR), $(BOUT++_VER))

BOUT++: FORCE | $(BOUT++_DIR)
	$(call GIT_PULL, $(BOUT++_GIT), $(BOUT++_DIR), $(BOUT++_VER))
	@cd $(BOUT++_DIR); ./configure
	@cd $(BOUT++_DIR); make
