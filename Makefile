OMFIT_GIT=git@github.com:gafusion/OMFIT-source.git
OMFIT_DIR=OMFIT-source
OMFIT_VER=unstable # master & unstable
OMFIT_WEBDIR=OMFIT-docs

IPS_ATOM_GIT=git@github.com:ORNL-Fusion/ips-atom.git
IPS_ATOM_DIR=ips-atom
IPS_ATOM_VER=devel # master & devel

GACODE_GIT=git@github.com:gafusion/gacode.git
GACODE_DIR=gacode
GACODE_VER=master # stable & master

GACODE_ADD_GIT=git@github.com:gafusion/gacode_add.git
GACODE_ADD_DIR=gacode_add
GACODE_ADD_VER=master # master

EPED_GIT=git@github.com:gafusion/EPED.git
EPED_DIR=EPED-source
EPED_VER=master # master

HARVEST_CLIENT_GIT=git@github.com:gafusion/harvest_client.git
HARVEST_CLIENT_DIR=harvest_client
HARVEST_CLIENT_VER=master # master

ATOM_DOC_GIT=git@github.com:scidac/atom-doc.git
ATOM_DOC_DIR=atom-doc
ATOM_DOC_VER=master # master

ATOM_GIT=git@github.com:scidac/atom.git
ATOM_WEBDIR=atom-website

ALL= OMFIT IPS_ATOM GACODE HARVEST_CLIENT GACODE_ADD EPED

GIT_CLONE   = @echo ; echo ================; echo $(2) [clone] ; echo ================; git clone -b $(3) $(1) $(2) ; cd $(2) ; git submodule update --init --recursive
GIT_PULL    = @echo ; echo ================; echo $(2) [pull]  ; echo ================; cd $(2) ; git fetch ; git checkout $(3) ; git pull; git submodule update --init --recursive
GACODE_MAKE = @echo ; echo ================; echo $(1) [make]  ; echo ================; bash -c "export GACODE_PLATFORM=$(PLATFORM); export GACODE_ROOT=$(PWD)/$(GACODE_DIR); . $(GACODE_ROOT)/shared/bin/gacode_setup; cd $(1); $(2)"

help:
	@echo "Usage: make ... PLATFORM=..."
	@echo
	@echo "Suppoerted platforms:"
	@if [ -a "$(GACODE_DIR)" ]; then echo `ls $(GACODE_DIR)/shared/install/ | sed s/\
make\.inc\.//g | tr -s '\n' '\t' > platform`; fi;
	@cat platform
	@echo
	@echo
	@echo "Supported make options:"
	@echo
	@echo "all ATOM-website ATOM-online ATOM_DOC OMFIT OMFIT-website OMFIT-online IPS_ATOM GACODE GACODE_ADD HARVEST_CLIENT EPED"

all: $(ALL)

clean:
	rm -rf $(GACODE_DIR)
	rm -rf $(OMFIT_DIR)
	rm -rf $(GACODE_ADD_DIR)
	rm -rf $(EPED_DIR)
	rm -rf $(HARVEST_CLIENT_DIR)

FORCE:

#======
# AToM docs
#======
$(ATOM_DOC_DIR):
	$(call GIT_CLONE, $(ATOM_DOC_GIT), $(ATOM_DOC_DIR), $(ATOM_DOC_VER))

ATOM_DOC: FORCE | $(ATOM_DOC_DIR)
	$(call GIT_PULL, $(ATOM_DOC_GIT), $(ATOM_DOC_DIR), $(ATOM_DOC_VER))


#======
# AToM website
#======
$(ATOM_WEBDIR)/html:
	mkdir -p $(ATOM_WEBDIR); cd $(ATOM_WEBDIR); git clone $(ATOM_GIT) -b gh-pages html

ATOM-website: FORCE | $(ATOM_WEBDIR)/html
	cd docs; make html

ATOM-online: FORCE | $(ATOM_WEBDIR)/html
	cd docs; make commit; make push

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

#===========
# GACODE_ADD
#===========
$(GACODE_ADD_DIR):
	$(call GIT_CLONE, $(GACODE_ADD_GIT), $(GACODE_ADD_DIR), $(GACODE_ADD_VER))

GACODE_ADD: FORCE | $(GACODE_ADD_DIR) $(GACODE_DIR) 
	$(call GIT_PULL, $(GACODE_ADD_GIT), $(GACODE_ADD_DIR), $(GACODE_ADD_VER))
	#missing make...

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
