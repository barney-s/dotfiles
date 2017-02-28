#!/usr/bin/env bash
set -x
set -e


function _install() {
  for shell in bash;
  do 
    echo "Installing shell $shell"
    shell/$shell/install.sh "install"
  done
}


function _restore() {
  for shell in bash;
  do 
    echo "Restoring shell $shell"
    shell/$shell/install.sh "restore"
  done
}


if [[ "$1" == "restore" ]]; then  
  export BACKUP_PATH=$2
  echo "restoring from $BACKUP_PATH"
  _restore $BACKUP_PATH
else
  export BACKUP_PATH="/tmp/dotfiles-$(date +%y%m%d.%H%M%S)"
  mkdir -p $BACKUP_PATH
  echo "backup directory is: $BACKUP_PATH"
  _install
fi

