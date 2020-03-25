#!/bin/bash
set -x

function package_install {
   which $1 || sudo apt-get install $2
}

function install_basic_sw {
  package_install nvim neovim
  package_install tmux tmux
  package_install git-review git-review
  package_install ctags ctags

  # https://opensource.com/article/19/5/python-3-default-mac
  # https://xkcd.com/1987/
  # TODO setup pyenv
  #  brew install pyenv
  #  pyenv install 3.7.3
  #  pyenv global 3.7.3
  python -m pip install --user --upgrade pynvim
  python3 -m pip install --user --upgrade pynvim
}

setup_zsh() 
{
   #sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

   # awesome list: https://github.com/unixorn/awesome-zsh-plugins#zgen-1
   #
   # Comparision of plugins: 
   #   - https://gist.github.com/laggardkernel/4a4c4986ccdcaf47b91e8227f9868ded
   #   - https://github.com/zdharma/pm-perf-test
   # zinit 
   #   - Fastest but status of project unreliable. Repo deleted and recreated.
   # zplug 
   #   - slow https://github.com/zplug/zplug
   # zgen 
   #   - tiny footprint. But unmaintained.
   #
   # Use zgen for now. Checkback on zplug later

   git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"
}

function install_pip {
   which pip && return || true
   curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
   sudo python get-pip.py
}

install_rustlang() 
{
   curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
   # get rustup
   # don't use hombrew
   curl https://sh.rustup.rs -sSf | sh
   source ~/.zprofile
   rustup self update

   RUST_CHANNEL=nightly
   # get ${RUST_CHANNEL} compiler
   rustup update ${RUST_CHANNEL}
   # after ${RUST_CHANNEL} installed
   rustup component add rls-preview --toolchain ${RUST_CHANNEL}
   rustup component add rust-analysis --toolchain ${RUST_CHANNEL}
   rustup component add rust-src --toolchain ${RUST_CHANNEL}
   rustup toolchain add ${RUST_CHANNEL}
   cargo +${RUST_CHANNEL} install racer
}

install_golang() 
{
  package_install go google-golang
}

# --- main ------------------------
setup_zsh
install_pip
install_basic_sw
install_nerd_fonts
install_rustlang
install_golang
