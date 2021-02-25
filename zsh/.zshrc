# Load fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# load zgen
source "${HOME}/.zgen/zgen.zsh"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

alias vim=nvim

ZGEN_RESET_ON_CHANGE=(${HOME}/.zshrc)

# if the init scipt doesn't exist
if ! zgen saved; then
    echo "Creating a zgen save"

    # ------- Installing
    # prezto options
    # zgen prezto editor key-bindings 'vim'

    # prezto and modules
    zgen prezto
    zgen prezto git
    zgen prezto command-not-found
    zgen prezto syntax-highlighting
    zgen prezto prompt 'powerlevel10k'

    # ------- Loads
    # completions
    zgen load zsh-users/zsh-completions src

    # theme
    zgen load romkatv/powerlevel10k powerlevel10k
    # save all to init script
    zgen save
fi

alias vim=nvim

function agr { ag -0 -Q -l "$1" | xargs -0 perl  -pi.bak -e "s/\Q$1\E/$2/g"; }

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source ~/.zprofile
