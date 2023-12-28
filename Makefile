INSTALL	= install -C -v
MKDIR = mkdir -v -m 0750 -p 

.PHONY:
all: $(HOME)/.bash_profile $(HOME)/.bashrc $(HOME)/.bashrc.d/custom.sh $(HOME)/.bash_logout

$(HOME)/.bash_profile: .bash_profile
	@$(INSTALL) $? $@

$(HOME)/.bashrc: .bashrc
	@$(INSTALL) $? $@

$(HOME)/.bashrc.d/custom.sh: .bashrc.d/custom.sh
	@$(MKDIR) $(HOME)/.bashrc.d/ || true
	@$(INSTALL) $? $@

$(HOME)/.bash_logout: .bash_logout
	@$(INSTALL) $? $@
