#! /bin/bash

set -e

cwd=$(pwd)

install_nix() {
    if hash nix-env 2>/dev/null; then
        echo "Nix is available"
    else
        echo "Install Nix"
        curl https://nixos.org/nix/install | sh
    fi
}

install_tmux() {
    echo "Setup tmux"
    ln -sf "$cwd"/.tmux.conf $HOME/.tmux.conf
    tmux source-file $HOME/.tmux.conf
}

install_vim() {
    echo "Setup vim"
    if [ -d ~/.vim_runtime ]; then
        cd ~/.vim_runtime; git pull
    else
        git clone https://github.com/amix/vimrc.git ~/.vim_runtime
        sh ~/.vim_runtime/install_awesome_vimrc.sh
    fi
    ln -sf "$cwd"/.vimrc $HOME/.vim_runtime/my_configs.vim
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

install_shell() {
    echo "Setup shell"
    echo "source $cwd/.bashrc" >> $HOME/.bashrc
    source $HOME/.bashrc
}

## main
install_nix
install_tmux
install_vim
install_shell
