PATH=$PATH:/sbin:/usr/sbin

PS1='\[\e]0;[\u@\h:\w]\a\]\u@\h:\w\$ '
EDITOR=vi

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


set -o vi
shopt -s histappend
unset HISTFILESIZE HISTSIZE
export EDITOR PATH PS1 HISTFILESIZE HISTSIZE
