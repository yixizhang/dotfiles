#!/usr/bin/env bash

set -e

cwd=$(pwd)

install_pacapt() {
    sudo wget -O /usr/local/bin/pacapt https://github.com/icy/pacapt/raw/ng/pacapt
    sudo chmod 755 /usr/local/bin/pacapt
    if hash /usr/local/bin/pacapt 2>/dev/null; then
        echo "pacman is available, skip ln"
    else
        sudo ln -sv /usr/local/bin/pacapt /usr/local/bin/pacman || true
    fi
}

install_nix() {
    if hash nix-env 2>/dev/null; then
        echo "Nix is available"
    else
        if [[ $(id -u) -eq 0 ]]; then
            mkdir -p /etc/nix
            echo "build-users-group =" > /etc/nix/nix.conf
        fi
        echo "Install Nix"
        curl https://nixos.org/nix/install | sh
        echo ". $HOME/.nix-profile/etc/profile.d/nix.sh" >> "$HOME"/.bashrc
    fi
}

setup_tmux() {
    echo "Setup tmux"
    ln -sf "$cwd"/.tmux.conf "$HOME"/.tmux.conf
    if ! { [ "$TERM" = "screen" ] && [ -n "$TMUX" ]; } then
        echo "TMUX is not running, stop here."
    else
        tmux source-file "$HOME"/.tmux.conf
    fi
}

install_tmux() {
    if ! hash tmux 2>/dev/null; then
        echo "TMUX is not available, install it now."
        pacman -S tmux
    fi
    setup_tmux
}

install_vim() {
    echo "Setup vim"
    if ! hash vim 2>/dev/null; then
        echo "VIM is not available, install vim-nox (version 8.0) now."
        sudo add-apt-repository ppa:pi-rho/dev
        sudo apt update
        sudo apt-get install vim-nox
    fi
    if [ -d ~/.vim_runtime ]; then
        cd ~/.vim_runtime; git pull
    else
        git clone https://github.com/amix/vimrc.git ~/.vim_runtime
        sh ~/.vim_runtime/install_awesome_vimrc.sh
    fi
    ln -sf "$cwd"/.vimrc "$HOME"/.vim_runtime/my_configs.vim
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    # install preset plugins via vim-plug
    vim -c "PlugInstall|q|q"
}

install_shell() {
    echo "Setup shell"
    echo "source $cwd/.bashrc" >> "$HOME"/.bashrc
}

## main
#install_pacapt
#install_nix
install_tmux
install_vim
install_shell
