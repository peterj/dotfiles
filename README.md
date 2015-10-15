# dotfiles
Most of these files are based off of https://github.com/jfrazelle/mac-dev-setup
and https://github.com/mathiasbynens/dotfiles.

1. Install Xcode command line tools
```bash
$ xcode-select --install
```

2. Install Homebrew
```bash
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

3. Install Bash
```bash
$ brew install bash
$ chsh -s /usr/local/bin/bash
```

4. Install bash-completion, grc, git and node
```bash
$ brew install bash-completion
$ brew install grc
$ brew install git
$ brew install node
```

## Apps to install
- [ITerm2](https://www.iterm2.com/downloads.html)
- [GitHub Desktop](https://central.github.com/mac/latest)
- [Chrome](https://www.google.com/chrome/browser/desktop/index.html)
- [Flux](https://justgetflux.com/)

## Git
- make git logs pretty (git lg): git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

## Vim
- Install Vim from [here](https://github.com/jfrazelle/.vim)

## Install dotfiles
```bash
cd ~
curl -O https://raw.githubusercontent.com/pj3677/dotfiles/master/git/.gitconfig
curl -O https://raw.githubusercontent.com/pj3677/dotfiles//master/.bash_profile
curl -O https://raw.githubusercontent.com/pj3677/dotfiles/master/.helpers
curl -O https://raw.githubusercontent.com/pj3677/dotfiles/master/.aliases
curl -O https://raw.githubusercontent.com/pj3677/dotfiles/master/.bash_prompt
curl -O https://raw.githubusercontent.com/pj3677/dotfiles/master/.exports
curl -O https://raw.githubusercontent.com/pj3677/dotfiles/master/.functions
curl -O https://raw.githubusercontent.com/pj3677/dotfiles/master/.inputrc
```
