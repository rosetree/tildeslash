#!/bin/bash

alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Some ls aliases
alias ll='ls -AlhF'
alias la='ls -A'
alias l='ls -CF'
alias ld="ll | grep -E '^d'"

# Quickly connect monitors
alias mon_cm='xrandr --output VGA-0 --auto --rotate left --right-of LVDS'
alias mon_jm='xrandr --output VGA-0 --auto --above LVDS'

# Automatically create directory paths.
alias mkdir='mkdir -p'

# Use kramdown instead of the original markdown
alias markdown='kramdown'

# Quick check my writings for commonly misused phrases.
alias check="diction -b -s -L de"
alias checken="diction -b -s -L en"

# Download youtube videos in opus.
alias yt2opus='youtube-dl -x --audio-format opus --audio-quality 0'

# Show custom git logs.
#alias gitlogs='git log --format="%Cgreen%h%Creset %s%n%Cblue(%an <%ae>)"%n'
alias gitlogs="git log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"

# Open files in existing GVim window
alias gvim='gvim --remote-silent'
# Start GVim with local session file
alias svim='gvim -S .session.vim'
# Start Vim in terminal with local session file
alias vims='vim -S .session.vim'

alias ag='ag --pager "less -r"'
alias ack='ack-grep'

# This finds all lines containing `TODO', `FIXME' or `XXX' in the current
# working directory and all subdirectories.
alias todo='ag -i "(TODO|FIXME|X{3})"'

# Easily lock my screen, when I am about to leave.
alias afk_coffee='i3lock -c c0ffee -i ~/.i3/lock-coffee.png'

# A delete function, that only moves deleted files to a folder in ~. This
# function requires a tag as first parameter.
function delete ()
{
	NOW=`date +%Y%m%d%H%M%S`
	DELETE_PATH=~/.deleted/$1-$NOW
	shift
	mkdir $DELETE_PATH && mv $@ $DELETE_PATH
}

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
				delete "rm" $@
				break;;
			No )
				return;;
		esac
	done
}

# Convert an .html.erb file to .haml. Delete the old .html.erb file.
function erb2haml ()
{
	html2haml --erb $1.html.erb $1.haml
	delete "erb2html" $1.html.erb
}

function add_image_data () {
	exiftool -Artist='Micha Rosenbaum' -Author='Micha Rosenbaum' -Creator='Micha Rosenbaum' -Copyright='CC-BY-SA 3.0 DE' .
	delete "image_data" *original
}
