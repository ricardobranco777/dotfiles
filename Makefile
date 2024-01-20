INSTALL	= cp
MKDIR = mkdir -p -m 0700

BASH = $(HOME)/.bash_profile $(HOME)/.bashrc $(HOME)/.bashrc.d/custom.sh $(HOME)/.bash_logout
VIM = $(HOME)/.vimrc
GIT = $(HOME)/.gitconfig $(HOME)/.ssh/id_ed25519.pub

.PHONY:
install: $(BASH) $(VIM) $(GIT)

$(HOME)/.bash_profile: .bash_profile
	$(INSTALL) $? $@

$(HOME)/.bashrc: .bashrc
	$(INSTALL) $? $@

$(HOME)/.bashrc.d/custom.sh: .bashrc.d/custom.sh
	@$(MKDIR) $(HOME)/.bashrc.d/ || true
	$(INSTALL) $? $@

$(HOME)/.bash_logout: .bash_logout
	$(INSTALL) $? $@

$(HOME)/.vimrc: .vimrc
	$(INSTALL) $? $@

$(HOME)/.gitconfig: .gitconfig
	$(INSTALL) $? $@

$(HOME)/.ssh/id_ed25519.pub: .ssh/id_ed25519.pub
	@$(MKDIR) $(HOME)/.ssh/ || true
	$(INSTALL) $? $@
