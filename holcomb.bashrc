# Prefer homedir local stuff
if [[ -d ~/bin ]] && [[ ! $PATH =~ ~/bin ]]
then
	PATH=~/bin:$PATH
fi
if [[ -d ~/man ]] && [[ ! $MANPATH =~ ~/man ]]
then
	MANPATH=~/man:$MANPATH
fi

if ! ssh-add -l > /dev/null 2>&1
then
	if [ -f ~/.ssh-agent ]
	then
		. ~/.ssh-agent
		if ! ssh-add -l > /dev/null 2>&1
		then
			ssh-add
		fi
    else
		ssh-agent | grep -v 'Agent pid' > ~/.ssh-agent
		.  ~/.ssh-agent
		ssh-add
	fi
fi

# vi forever
set -o vi
EDITOR=vi

# prompt
PS1='\u@\h[\w]\$ '
case "$TERM" in
	xterm*|rxvt*|screen*)
		PROMPT_COMMAND='echo -en "\033];${USER}@${HOST}[${PWD}]\$\007"'
	;;
	*)
	;;
esac

# aliases
alias ls='ls -F'
alias rm='rm -i'
# git aliases
alias gb='git branch'
alias gba='git branch -a'
alias gc='git commit -v'
alias gd='git diff'
alias gl='git pull'
alias gp='git push'
alias gst='git status'
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
