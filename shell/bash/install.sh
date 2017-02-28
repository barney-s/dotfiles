#!/usr/bin/env bash
set -x
set -e

BP=$BACKUP_PATH/shell/bash/
files=".bash_prompt .bash_profile"
SRCDIR=$(dirname "$0")

function backup_bash_config() {
   echo "backing up to $BP"
   for file in $files; do
      echo " - $file"
      cp ~/$file $BP
   done 
}


function install_bash_config() {
   echo "installing"
   for file in $files; do
      echo " - $file"
      cp $SRCDIR/$file ~/
   done 

}

function restore_bash_config() {
   echo "restoring from $BP"
   for file in $files; do
      echo " - $file"
      cp $BP/$file ~/
   done 
}


if [[ "$1" == "restore" ]]; then  
  restore_bash_config
else
  mkdir -p $BP
  backup_bash_config
  install_bash_config
fi

