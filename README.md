### ⚪️ Minimal dotfile setup

These configs can be used solely with vim — simply remove the iTerm2 config. I've found this setup to work quite well by swapping between VSCode and vim (or just vim!). [Ping me](https://twitter.com/timcchang) if you have questions or suggestions!

<img width="1552" alt="Screen Shot 2020-06-19 at 4 32 42 PM" src="https://user-images.githubusercontent.com/12195101/85177657-8eb87a00-b24a-11ea-8779-02ee260b7d11.png">

### Features
- Fuzzy search & autocomplete in terminal
- `git branches` to swap branches super quickly 
- `git diff` for super nice diffs 
- go to current buffer's location in the repository's tree

### Setup
From a clean OS:

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
