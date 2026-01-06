if [ -z "$GIT_PROMPT_ONLY_IN_REPO" -a -f "$HOME/.bash-git-prompt/gitprompt.sh" ] ; then
	GIT_PROMPT_ONLY_IN_REPO=1
	GIT_PROMPT_START="[\u@\h \w]"
	GIT_PROMPT_END=" "
	. "$HOME/.bash-git-prompt/gitprompt.sh"
fi
