#!/bin/bash

rm -f ~/.bashrc
rm -f ~/.bash_aliases
rm -f ~/.gitexcludes
rm -f ~/.gitconfig
rm -f ~/.signature
rm -f ~/.vimrc
rm -rf ~/.i3
rm -rf ~/bin
rm -rf ~/.vim

ln -s ~/.tildeslash/.bashrc ~/.bashrc
ln -s ~/.tildeslash/.bash_aliases ~/.bash_aliases
ln -s ~/.tildeslash/.gitexcludes ~/.gitexcludes
ln -s ~/.tildeslash/.gitconfig ~/.gitconfig
ln -s ~/.tildeslash/.signature ~/.signature
ln -s ~/.tildeslash/.vimrc ~/.vimrc
ln -s ~/.tildeslash/.i3 ~/.i3
ln -s ~/.tildeslash/bin ~/bin
ln -s ~/.tildeslash/.vim ~/.vim

# Directory used to store temporary vim files.
mkdir -p ~/tmp/.vim/swap
mkdir -p ~/tmp/.vim/bundle

source "./.private/setup.sh"
