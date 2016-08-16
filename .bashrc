# ~/.bashrc
#
# Source:
#   https://github.com/rosetree/tildeslash/

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# Ignore some commands
HISTIGNORE="ll:ls:la:cd -:fg:bg"

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

PS1='\n\[\e[0;32m\]\w$(__git_ps1) · \j running\n\$ \[\e[0m\]'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
if [ -f ~/Documents/projects/mdr/tildeslash/.bash_aliases ]; then
	. ~/Documents/projects/mdr/tildeslash/.bash_aliases
fi

if [ -f ~/Documents/projects/mdr/tildeslash/bash/jump.sh ]; then
	export MARKPATH=$HOME/Documents/.xxx/marks
	. ~/Documents/projects/mdr/tildeslash/bash/jump.sh
fi

if [ -f ~/Documents/projects/mdr/tildeslash/bash/tmp_work.sh ]; then
	. ~/Documents/projects/mdr/tildeslash/bash/tmp_work.sh
fi


# Local scripts.
if [ -d ~/bin ]; then
	export PATH="$PATH:~/bin"
fi

# Specify my bookkeeping file.
if [ -f ~/Documents/accounting/master.ledger ]; then
	export LEDGER_FILE=~/Documents/accounting/master.ledger
fi

export EDITOR=nvim

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
fi

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
