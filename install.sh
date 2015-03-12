#!/usr/bin/env bash

# Link the .vimrc file into place

echo "Linking ~/.vimrc into place"
ln -s ~/workshop-dotfiles/.vimrc ~/.vimrc
echo "Linking ~/.vim into place"
ln -s ~/workshop-dotfiles/.vim ~/.vim

# Install ag, the silver searcher
sudo apt-get install silversearcher-ag
