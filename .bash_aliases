#!/bin/bash

# Some ls aliases
alias ll='ls -AlhF'
alias la='ls -A'
alias l='ls -CF'

# Automatically create directory paths.
alias mkdir='mkdir -p'
# Start GVim with local session file
alias svim='gvim -S .session.vim'
# Start Vim in terminal with local session file
alias vims='vim -S .session.vim'

# Learned from using `rm -rf ~/`
# TODO: This could have a bad learning effect. Think about it.
function rm ()
{
	ll -R $@ | less
	echo "Do you really want to delete all those files shown?"
	select yn in "Yes" "No"
	do
		case $yn in
			Yes )
				NOW=`date +%Y%m%d%H%M%S`;
				mkdir ~/.deleted/$NOW && mv $@ ~/.deleted/$NOW;
				unset NOW;
				break;;
			No )
				return;;
		esac
	done
}

# change To Directory and show the ToDo list
function td ()
{ 
	cd "$@" && todo
}
