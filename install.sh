#!/bin/sh
# Prerequisites: Ubuntu distro, bash/zsh shell
# TODO: 1. install dependencies if not already installed
#       2. relative path during installation (environment var?)

# vim
ln -s $(pwd)/vimrc $HOME/.vimrc

# tmux
ln -s $(pwd)/tmux.conf $HOME/.tmux.conf

# zsh
ln -s $(pwd)/zshrc $HOME/.zshrc