PATH=$PATH:/sbin:/usr/sbin

set -o vi
EDITOR=vi

PS1='\[\e]0;\h:\w\a\]\h:\w\$ '

alias ls='ls -F'
alias rm='rm -i'
case `uname -s` in
	Linux)
		alias ptree='pstree -aclnpuU'
	;;
	OpenBSD)
		alias ptree='pstree -g 3 -w'
	;;
esac

export EDITOR PATH PS1
