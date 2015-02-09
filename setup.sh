#!/bin/bash

rm -f ~/.bashrc
rm -f ~/.bash_aliases
rm -f ~/.gitexcludes
rm -f ~/.gitconfig
rm -f ~/.signature
rm -f ~/.Xmodmap
rm -f ~/.vimrc
rm -f ~/.ackrc
rm -rf ~/.i3
rm -rf ~/bin
rm -rf ~/.vim

ln -s ~/.tildeslash/.bashrc ~/.bashrc
ln -s ~/.tildeslash/.bash_aliases ~/.bash_aliases
ln -s ~/.tildeslash/.gitexcludes ~/.gitexcludes
ln -s ~/.tildeslash/.gitconfig ~/.gitconfig
ln -s ~/.tildeslash/.signature ~/.signature
ln -s ~/.tildeslash/.Xmodmap ~/.Xmodmap
ln -s ~/.tildeslash/.vimrc ~/.vimrc
ln -s ~/.tildeslash/.ackrc ~/.ackrc
ln -s ~/.tildeslash/.i3 ~/.i3
ln -s ~/.tildeslash/bin ~/bin
ln -s ~/.tildeslash/.vim ~/.vim

# Directory used to store temporary vim files.
mkdir -p ~/tmp/.vim/swap
mkdir -p ~/tmp/.vim/bundle

# Install vim plugins.
cd ~/.tildeslash && git submodule update --init

source "./.private/setup.sh"
