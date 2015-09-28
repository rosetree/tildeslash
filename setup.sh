#!/bin/bash

rm -f ~/.bashrc
rm -f ~/.bash_aliases
rm -f ~/.gitexcludes
rm -f ~/.gitconfig
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
ln -s ~/.tildeslash/.Xmodmap ~/.Xmodmap
ln -s ~/.tildeslash/.vimrc ~/.vimrc
ln -s ~/.tildeslash/.ackrc ~/.ackrc
ln -s ~/.tildeslash/.i3 ~/.i3
ln -s ~/.tildeslash/bin ~/bin
ln -s ~/.tildeslash/.vim/bundle/voom/voom ~/bin/voom
ln -s ~/.tildeslash/.vim ~/.vim
# Voom requirement
ln -s ~/.tildeslash/.vim ~/dotvim

# Directory used to store temporary vim files.
mkdir -p ~/tmp/.vim/swap
mkdir -p ~/tmp/.vim/bundle
mkdir -p ~/tmp/.vim/undo

# Install vim plugins.
cd ~/.tildeslash/.vim/bundle
git clone https://github.com/airblade/voom.git
cd voom
./voom

source "./.private/setup.sh"
