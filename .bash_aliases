#!/bin/bash

# Some ls aliases
alias ll='ls -AlhF'
alias la='ls -A'
alias l='ls -CF'

# Quickly connect monitors
alias mon_cm='xrandr --output VGA-0 --auto --rotate left --right-of LVDS'
alias mon_jm='xrandr --output VGA-0 --auto --above LVDS'

# Automatically create directory paths.
alias mkdir='mkdir -p'

# Use kramdown instead of the original markdown
alias markdown='kramdown'

# Download youtube videos in opus.
alias yt2opus='youtube-dl -x --audio-format opus --audio-quality 0'

# Show custom git logs.
#alias gitlogs='git log --format="%Cgreen%h%Creset %s%n%Cblue(%an <%ae>)"%n'
alias gitlogs='git log --format="%Cgreen%h %Cblue(%an <%ae>)"%n%s%n'

# Open files in existing GVim window
alias gvim='gvim -p --remote-tab-silent'
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

function erb2haml ()
{
	NOW=`date +%Y%m%d%H%M%S`
	DELETE_PATH=~/.deleted/erb2haml-$NOW

	html2haml --erb $1.html.erb $1.haml
	mkdir $DELETE_PATH
	mv $1.html.erb $DELETE_PATH
}
