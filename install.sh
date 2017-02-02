#! /bin/bash

tmux() {
    ln -sf $(pwd)/.tmux.conf $HOME/.tmux.conf
    tmux source-file $HOME/.tmux.conf
}

vim() {
    git clone https://github.com/amix/vimrc.git ~/.vim_runtime
    sh ~/.vim_runtime/install_awesome_vimrc.sh
    ln -sf $(pwd)/.vimrc $HOME/.vim_runtime/my_configs.vim
}

shell() {
    cat .bashrc >> $HOME/.bashrc
}

## main
tmux
vim
shell

