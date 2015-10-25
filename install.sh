#!/bin/sh
# Prerequisites: Ubuntu distro, bash/zsh shell
# TODO: 1. install dependencies if not already installed
#       2. relative path during installation (environment var?)

# vim
ln -s $(pwd)/vimrc $HOME/.vimrc

# jump to opening/closing tags by typing %
mkdir -p $HOME/.vim/plugin
VIMRUNTIME=`vim -e -T dumb --cmd 'exe "set t_cm=\<C-M>"|echo $VIMRUNTIME|quit' | tr -d '\015' `
cp $VIMRUNTIME/macros/matchit.vim $HOME/.vim/plugin

# tmux
ln -s $(pwd)/tmux.conf $HOME/.tmux.conf

# zsh
ln -s $(pwd)/zshrc $HOME/.zshrc

ln -s $(pwd)/reference_cards $HOME/.vim/reference_cards
