#!/usr/bin/env bash
#set -x
set -o errexit
set -o pipefail
set -o nounset


function usage() 
{
cat <<- END

Installation script for dotfiles
--------------------------------
Script to install all relevant dotfiles.
When invoked without parameters it takes a backup of existing files 
and replaces them with the one in this repo.


Usage: install.sh -i,--install|-r,--restore <restore_path>|-h,--help

Optional:
    -i,--install           install dotfiles
    -r,--restore <path>    restore from path to backup 
    -h,--help              usage
END

exit $1
}


source_dir=$(dirname "$0")
install_list="install.list"

function backup_config_files() {
  echo "backing up:"
  while read line || [[ -n "$line" ]]; do
    src=$(echo $line | awk '{print $1}')
    dst=$(echo $line | awk '{print $2}')
    dst=${dst/#\~/$HOME}
    srcpath=$(dirname $src)
    mkdir -p $BACKUP_PATH/$srcpath
    echo "  - $dst"
    cp -r $dst $BACKUP_PATH/$srcpath || true
  done < $source_dir/$install_list
}

function install_config_files() {
  echo "installing:"
  while read line || [[ -n "$line" ]]; do
    src=$(echo $line | awk '{print $1}')
    dst=$(echo $line | awk '{print $2}')
    dst=${dst/#\~/$HOME}
    if [ -f $dst ]; then
      echo "  + $dst"
      cp $src $dst
    else
      echo "  +d $dst"
      mkdir -p $dst
      cp -r $src/* $dst
    fi
  done < $source_dir/$install_list
}

function restore_config_files() {
  echo "restoring from $BACKUP_PATH:"
  while read line || [[ -n "$line" ]]; do
    src=$(echo $line | awk '{print $1}')
    dst=$(echo $line | awk '{print $2}')
    dst=${dst/#\~/$HOME}
    srcpath=$(basename $src)
    if [ -f $BACKUP_PATH/$src ]; then
       echo "  * $dst"
       cp $BACKUP_PATH/$src $dst
    fi
  done < $source_dir/$install_list
}


function _install() {
  export BACKUP_PATH="/tmp/dotfiles-$(date +%y%m%d.%H%M%S)"
  mkdir -p $BACKUP_PATH
  backup_config_files
  install_config_files
  echo "backedup existing dotfiles to: $BACKUP_PATH"
}


function _restore() {
  export BACKUP_PATH=$1
  restore_config_files
}



## ----------------------- parse args -----------------------
if [[ $# -lt 1 ]]; then
  usage 1
fi
while [[ $# -ge 1 ]]
do
key="$1"
case $key in
    -i|--install)
       _install
       exit 
    ;;
    -r|--restore)
      if [ ! -d $2 ]; then
         usage 1
      fi
      _restore $2
      shift
    ;;
    -h|--help)
      usage 0
    ;;
    *)
      echo -e "ignoring unknown option: $key"
    ;;
esac
shift
done
