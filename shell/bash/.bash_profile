#!/bin/bash -x

export TERM=screen-256color
export PROMPT_SIZE="wide"
source ~/.bash_prompt
if [ -f ~/.bash_local_aliases ]; then
   source ~/.bash_local_aliases
fi
alias vim=nvim

function agr { ag -0 -Q -l "$1" | xargs -0 perl  -pi.bak -e "s/\Q$1\E/$2/g"; }
export -f agr

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
