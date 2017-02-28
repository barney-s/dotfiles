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




function _install() {
  export BACKUP_PATH="/tmp/dotfiles-$(date +%y%m%d.%H%M%S)"
  mkdir -p $BACKUP_PATH
  for shell in bash;
  do 
    echo "Installing shell $shell"
    shell/$shell/install.sh "install"
  done
  echo "backedup existing dotfiles to: $BACKUP_PATH"
}


function _restore() {
  export BACKUP_PATH=$1
  echo "restoring from $BACKUP_PATH"
  for shell in bash;
  do 
    echo "Restoring shell $shell"
    shell/$shell/install.sh "restore"
  done
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
