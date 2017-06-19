#!/bin/bash

# --- install basic sw ----------------------
function install_brew {
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

function install_basic_sw {
  brew install neovim/neovim/neovim
  brew install tmux
  brew install git-review
}

function install_nerd_fonts {
  brew tap caskroom/fonts
  brew cask install font-hack-nerd-font
  brew cask install font-dejavusansmono-nerd-font
}



# --- main ------------------------
#install_brew
#install_basic_sw
install_nerd_fonts
