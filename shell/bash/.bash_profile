export TERM=screen-256color
export PROMPT_SIZE="wide"
source ~/.bash_prompt
if [ -f ~/.bash_local_aliases ]; then
   source ~/.bash_local_aliases
fi
# added by Anaconda3 4.2.0 installer
export PATH="//anaconda/bin:$PATH"

alias vim=nvim
