# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="/Users/tim/.oh-my-zsh"

# Ignored paths for fzf
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

# Ignoring for now since we're using Powerlevel10k
# ZSH_THEME="muse"

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
alias gbb='git branches'
alias gs='git status'

if [[ -a ~/.abstract ]]; then
  source ~/.abstract
fi

# Powerlevel10k theme
source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
