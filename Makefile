INSTALL	= cp
MKDIR = mkdir -p -m 0700

BASH = $(HOME)/.bash_profile $(HOME)/.bashrc $(HOME)/.bashrc.d/custom.sh $(HOME)/.bash_logout
DOAS = $(HOME)/.bashrc.d/doas.sh
GIT = $(HOME)/.gitconfig $(HOME)/.ssh/id_ed25519.pub $(HOME)/.ssh/allowed_signers
PERL = $(HOME)/.perltidyrc
PODMAN = $(HOME)/.bashrc.d/podman.sh
VIM = $(HOME)/.vimrc
WGET = $(HOME)/.bashrc.d/wget.sh

.PHONY:
install: $(BASH) $(DOAS) $(GIT) $(PERL) $(PODMAN) $(VIM) $(WGET)

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

$(HOME)/.bashrc.d/podman.sh: .bashrc.d/podman.sh
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
