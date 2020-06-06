# Path to your oh-my-zsh installation.
export ZSH="/Users/tim/.oh-my-zsh"

# Ignored paths for fzf
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

ZSH_THEME="muse"

plugins=(
  git
  fzf
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# Custom aliases
alias python="python3.7"
alias ss="python -m http.server 8888"
alias checkport='netstat -vanp tcp | grep'
alias ls='ls -GFh'
alias ll='ls -1a'
alias ..='cd ../'

if [[ -a ~/.abstract ]]; then
  source ~/.abstract
fi
