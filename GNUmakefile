
# Note: cp -v is not supported on OpenBSD
INSTALL	:= cp
MKDIR	:= mkdir -p -m 0700

HOMEFILES = \
	.bash_profile \
	.bashrc \
	.bash_logout \
	.bashrc.d/bash.sh \
	.bashrc.d/custom.sh \
	.bashrc.d/doas.sh \
	.bashrc.d/git.sh \
	.bashrc.d/glibc.sh \
	.bashrc.d/gnu.sh \
	.bashrc.d/golang.sh \
	.bashrc.d/manpages.sh \
	.bashrc.d/nocore.sh \
	.bashrc.d/nosystemd.sh \
	.bashrc.d/podman.sh \
	.bashrc.d/python.sh \
	.bashrc.d/tilix.sh \
	.bashrc.d/vim.sh \
	.bashrc.d/wget.sh \
	.gitconfig \
	.perltidyrc \
	.ssh/id_ed25519.pub \
	.ssh/allowed_signers \
	.vimrc

TARGETS := $(addprefix $(HOME)/,$(HOMEFILES))

.PHONY: install
install: $(TARGETS)

$(HOME)/%: %
	@$(MKDIR) $(dir $@)
	$(INSTALL) $< $@
