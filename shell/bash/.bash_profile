#!/bin/bash -x

export TERM=screen-256color
export PROMPT_SIZE="wide"
source ~/.bash_prompt
if [ -f ~/.bash_local_aliases ]; then
   source ~/.bash_local_aliases
fi
alias vim=nvim

function agr { ag -0 -l "$1" | AGR_FROM="$1" AGR_TO="$2" xargs -r0 perl -pi -e 's/$ENV{AGR_FROM}/$ENV{AGR_TO}/g'; }

export -f agr

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
