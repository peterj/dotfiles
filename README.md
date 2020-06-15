# dotfiles
Most of these files are based off of https://github.com/jfrazelle/mac-dev-setup
and https://github.com/mathiasbynens/dotfiles.

## Install Xcode command line tools
```bash
xcode-select --install
```
## Installation 
```
./setup.sh
```

## Apps to install
- [Evernote](https://evernote.com/download/)
- [GifGrabber](http://www.gifgrabber.com/)
- [DiffMerge](http://www.sourcegear.com/diffmerge/downloads.php)
- [RoboMongo](https://robomongo.org/download)
- [Day-O](https://shauninman.com/archive/2016/10/20/day_o_2_mac_menu_bar_clock)

## Git
- make git logs pretty (git lg):
```bash
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
```

## Vim
- Install Vim settings from [here](https://github.com/jfrazelle/.vim)

## Hammerspoon

1. Download [Hammerspoon](https://github.com/Hammerspoon/hammerspoon/releases) (or `brew cask install hammerspoon` OR `setup.sh` if it's a clean machine)
1. Install [SpoonInstall](https://www.hammerspoon.org/Spoons/SpoonInstall.html)