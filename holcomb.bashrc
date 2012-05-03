# Prefer homedir local stuff
if [ -f ~/bin ] && [ ! $PATH =~ '\~\/bin' ]
then
	PATH=~/bin:$PATH
fi
if [ -f ~/man ] && [ ! $PATH =~ '\~\/man' ]
then
	MANPATH=~/man:$MANPATH
fi

# vi mode forever
set -o vi

# prompt
PS1='\u@\h[\w]\$ '
case "$TERM" in
	xterm*|rxvt*|screen*)
		PS1="\[\e]0;\u@\h[\w]\$\]$PS1"
	;;
	*)
	;;
esac

# aliases
alias ls='ls -F'
alias rm='rm -i'
case `uname -s` in
	Linux)
		alias ptree='pstree -aclnpuU'
		alias prstat='top'
	;;
	OpenBSD)
		alias prstat='top -S'
		alias ptree='pstree -g 3 -w'
	;;
esac
