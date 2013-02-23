PATH=$PATH:/sbin:/usr/sbin

# vi forever
set -o vi
EDITOR=vi

# prompt
PS1='\[\e]0;\u@\h:\w\a\]\u@\h:\w\$ '
#PS1='\u@\h[\w]\$ '

# aliases
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

export EDITOR PATH MANPATH PS1
