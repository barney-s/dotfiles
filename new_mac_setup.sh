#!/bin/bash

# --- install basic sw ----------------------
function install_brew {
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

function install_basic_sw {
  brew install neovim/neovim/neovim
  #sudo easy install neovim
  brew install tmux
  brew install git-review
  brew install ctags

  python -m pip install --user --upgrade pynvim
  python3 -m pip install --user --upgrade pynvim
}

function install_nerd_fonts {
  brew tap homebrew/cask-fonts
  brew cask install font-hack-nerd-font
  brew cask install font-dejavusansmono-nerd-font
}

function install_pip {
   curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
   sudo python get-pip.py
}

# --- main ------------------------
install_brew
install_pip
install_basic_sw
install_nerd_fonts

