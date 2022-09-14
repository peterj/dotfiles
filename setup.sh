#!/bin/bash
# Gets the script folder
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

for file in $(ls -a | egrep '^\.')
do
    if [ -f "$file" ]; then
        echo "Linking $file"
        ln -sfv $DIR/$file $HOME/$file
    fi
done

ln -sfv $DIR/git/.gitconfig $HOME/.gitconfig
ln -sfv $DIR/git/.git-completion.bash $HOME/.git-completion.bash
if [[ $OSTYPE == 'darwin'* ]]; then
  ln -sfv $DIR/.hammerspoon/init.lua $HOME/.hammerspoon/init.lua
  # Set macos defaults
  chmod a+x $DIR/set-defaults.sh && $DIR/set-defaults.sh
fi


# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# ---------- START BREW --------
brew update
brew upgrade
brew install findutils

# Install Bash 4.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

# Install more recent versions of some macOS tools.
brew install git
brew install grc
brew install kubectx
brew install node
brew install python3
brew install openssh
brew install ssh-copy-id
brew install tmux
brew install vim --with-override-system-vi
brew install yarn

# Cask
brew tap caskroom/cask
brew install brew-cask
brew tap caskroom/versions

if [[ $OSTYPE == 'darwin'* ]]; then
  brew cask install hammerspoon
  brew cask install --appdir="/Applications" google-chrome
  brew cask install --appdir="/Applications" slack
  brew cask install --appdir="/Applications" iterm2
  brew cask install --appdir="/Applications" visual-studio-code
  brew cask install minikube
fi

brew cleanup
# ---------- END BREW --------

