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
    local has_ruby_support=$(vim --version | grep -c "+ruby")
    if ! hash vim 2>/dev/null || [ $has_ruby_support -eq 0 ]; then
        echo "Install vim-nox (version 8.0) now."
        sudo add-apt-repository ppa:pi-rho/dev
        sudo apt update
        sudo apt-get install vim-nox
    fi
    rm -rf ~/.vim_runtime
    git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
    ln -sf "$cwd"/.vimrc ~/.vim_runtime/my_configs.vim
    echo 'set runtimepath+=~/.vim_runtime

    source ~/.vim_runtime/vimrcs/basic.vim
    source ~/.vim_runtime/vimrcs/filetypes.vim
    source ~/.vim_runtime/my_configs.vim' > ~/.vimrc
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    # install preset plugins via vim-plug
    vim -c "PlugInstall|q|q"
}

install_shell() {
    echo "Setup shell"
    echo "source $cwd/.bashrc" >> "$HOME"/.bashrc
}

install_configs() {
    echo "Setup configs"
    cp -r "$cwd/.config" "$HOME/"
}

## main
#install_pacapt
#install_nix
install_tmux
install_vim
install_shell
#install_configs
