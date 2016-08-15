#!/bin/bash

alias ls='ls --color=auto'
alias grep='grep -inr --color=auto'

# Some ls aliases
alias ll='ls -AlhF'
alias ld="ll | grep -E '^d'"

# Shutdown
alias bye='sudo shutdown -P now'

# Automatically create directory paths.
alias mkdir='mkdir -p'

# Quick check my writings for commonly misused phrases.
alias check="diction -b -s -L de"
alias checken="diction -b -s -L en"

# Show custom git logs.
#alias gitlogs='git log --format="%Cgreen%h%Creset %s%n%Cblue(%an <%ae>)"%n'
alias gitlogs="git log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"

# This finds all lines containing `TODO', `FIXME' or `XXX' in the current
# working directory and all subdirectories.
alias todo='ag -i "(TODO|FIXME|X{3})"'

alias man='man --nj'

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

function title
{
	# http://superuser.com/a/84711
	PROMPT_COMMAND="echo -ne \"\033]0;$@\007\""
}

# Convert an .html.erb file to .haml. Delete the old .html.erb file.
function erb2haml ()
{
	html2haml --erb $1.html.erb $1.haml
	delete "erb2html" $1.html.erb
}

function add_image_data () {
	exiftool -Artist="$*" -Author="$*" -Creator="$*" .
	delete "image_data" *original
}
