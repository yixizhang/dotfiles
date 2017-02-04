#! /bin/bash

set -e

cwd=$(pwd)

install_tmux() {
    echo "install tmux"
    ln -sf "$cwd"/.tmux.conf $HOME/.tmux.conf
    tmux source-file $HOME/.tmux.conf
}

install_vim() {
    echo "install vim"
    if [ -d ~/.vim_runtime ]
    then
        cd ~/.vim_runtime; git pull
    else
        git clone https://github.com/amix/vimrc.git ~/.vim_runtime
        sh ~/.vim_runtime/install_awesome_vimrc.sh
    fi
    ln -sf "$cwd"/.vimrc $HOME/.vim_runtime/my_configs.vim
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

install_shell() {
    echo "install shell"
    echo "source $HOME/dotfiles/.bashrc" >> $HOME/.bashrc
    source $HOME/.bashrc
}

## main
install_tmux
install_vim
install_shell

