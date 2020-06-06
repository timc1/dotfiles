#### Setup

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
```
