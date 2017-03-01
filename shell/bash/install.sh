#!/usr/bin/env bash
#set -x
set -o errexit
set -o pipefail
set -o nounset

bash_backup_path=$BACKUP_PATH/shell/bash/
source_dir=$(dirname "$0")
files=".bash_prompt .bash_profile"

function backup_bash_config() {
   echo "backing-up current dotfiles"
   for file in $files; do
      echo " - $file"
      cp ~/$file $bash_backup_path
   done 
}


function install_bash_config() {
   echo "installing dotfiles"
   for file in $files; do
      echo " - $file"
      cp $source_dir/$file ~/
   done 

}

function restore_bash_config() {
   echo "restoring from $bash_backup_path"
   for file in $files; do
      echo " - $file"
      cp $bash_backup_path/$file ~/
   done 
}


if [[ "$1" == "restore" ]]; then  
  restore_bash_config
else
  mkdir -p $bash_backup_path
  backup_bash_config
  install_bash_config
fi

