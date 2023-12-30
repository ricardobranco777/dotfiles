INSTALL	= install -C -m 0644 -v
MKDIR = mkdir -p -m 0750 -v

BASH = $(HOME)/.bash_profile $(HOME)/.bashrc $(HOME)/.bashrc.d/custom.sh $(HOME)/.bash_logout
VIM = $(HOME)/.vimrc

.PHONY:
install: $(BASH) $(VIM)

$(HOME)/.bash_profile: .bash_profile
	@$(INSTALL) $? $@

$(HOME)/.bashrc: .bashrc
	@$(INSTALL) $? $@

$(HOME)/.bashrc.d/custom.sh: .bashrc.d/custom.sh
	@$(MKDIR) $(HOME)/.bashrc.d/ || true
	@$(INSTALL) $? $@

$(HOME)/.bash_logout: .bash_logout
	@$(INSTALL) $? $@

$(HOME)/.vimrc: .vimrc
	@$(INSTALL) $? $@
