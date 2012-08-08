#!/bin/bash
# quick script to initialize environment with dotfiles

PATH=/bin:/usr/bin
BASHRC=~/.bashrc
SCREENRC=~/.screenrc


# avoid appending if personal bashrc is already being sourced
if ! grep '^. ~/src/dotfiles/holcomb.bashrc$' $BASHRC > /dev/null 2>&1
then
	# add a blank line if file exists
	if [ -f $BASHRC ]
	then
		echo "" >> $BASHRC
	fi
	echo "# Use system defaults, then include personal configuration" >> $BASHRC
	echo ". ~/src/dotfiles/holcomb.bashrc" >> $BASHRC
fi

# add link to screenrc
if [ -a $SCREENRC ]
then
	\rm $SCREENRC
fi
ln -s ~/src/dotfiles/screenrc $SCREENRC

# I really hate motds
touch ~/.hushlogin
