# Prefer homedir local stuff
if [[ -d ~/bin ]] && [[ ! $PATH =~ ~/bin ]]
then
	PATH=~/bin:$PATH
fi
if [[ -d ~/man ]] && [[ ! $MANPATH =~ ~/man ]]
then
	MANPATH=~/man:$MANPATH
fi

# vi forever
set -o vi
EDITOR=vi

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

export EDITOR PATH MANPATH PS1
