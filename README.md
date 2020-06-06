### ⚪️ Minimal dotfile setup

### Setup

From a clean OS:

- Fuzzy search & autocomplete in terminal
- `git branches` to swap branches super quickly 
- `git diff` for super nice diffs 
- Simple, all you need vim configs to get work done 

```
  brew install node
  brew install cmake
  brew install python

  // fzf uses silver searcher 
  brew install fzf
  brew install the_silver_searcher

  brew install vim

  // Better terminal diffs
  brew install diff-so-fancy
  git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"

  // Symlinks
  git clone git@github.com:timc1/dotfiles.git
  cd dotfiles
  ln -s path/to/dotfile/.zshrc ~/.zshrc
  ln -s path/to/dotfile/.zprofile ~/.zprofile
  ln -s path/to/dotfile/.vimrc ~/.vimrc

  // Git
  ln -s path/to/dotfile/.gitconfig ~/.gitconfig
```

Restart terminal 🎉
