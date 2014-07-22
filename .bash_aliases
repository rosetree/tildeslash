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

# change To Directory and show the ToDo list
function td ()
{ 
	cd "$@" && todo
}
