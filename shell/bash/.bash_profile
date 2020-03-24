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

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/usr/local/bin/google-cloud-sdk/path.bash.inc' ]; then . '/usr/local/bin/google-cloud-sdk/path.bash.inc'; fi

# local bin paths

export PATH=${HOME}/workspace/src/k8s.io/kubernetes/third_party/etcd:${PATH}
export PATH=${HOME}/workspace/bin:${PATH}
export PATH=${PATH}:/usr/local/kubebuilder/bin
export GOPATH=${HOME}/workspace

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
