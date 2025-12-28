INSTALL	= cp
MKDIR = mkdir -p -m 0700

BASH = $(HOME)/.bash_profile $(HOME)/.bashrc $(HOME)/.bashrc.d/custom.sh $(HOME)/.bashrc.d/doas.sh $(HOME)/.bashrc.d/wget.sh $(HOME)/.bash_logout
VIM = $(HOME)/.vimrc
GIT = $(HOME)/.gitconfig $(HOME)/.ssh/id_ed25519.pub $(HOME)/.ssh/allowed_signers
PERL = $(HOME)/.perltidyrc

.PHONY:
install: $(BASH) $(VIM) $(GIT) $(PERL)

$(HOME)/.bash_profile: .bash_profile
	$(INSTALL) $? $@

$(HOME)/.bashrc: .bashrc
	$(INSTALL) $? $@

$(HOME)/.bashrc.d/custom.sh: .bashrc.d/custom.sh
	@$(MKDIR) $(HOME)/.bashrc.d/ || true
	$(INSTALL) $? $@

$(HOME)/.bashrc.d/doas.sh: .bashrc.d/doas.sh
	@$(MKDIR) $(HOME)/.bashrc.d/ || true
	$(INSTALL) $? $@

$(HOME)/.bashrc.d/wget.sh: .bashrc.d/wget.sh
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

$(HOME)/.ssh/allowed_signers: .ssh/allowed_signers
	@$(MKDIR) $(HOME)/.ssh/ || true
	$(INSTALL) $? $@

$(HOME)/.perltidyrc: .perltidyrc
	$(INSTALL) $? $@
