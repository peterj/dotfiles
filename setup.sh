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
ln -sfv $DIR/.hammerspoon/init.lua $HOME/.hammerspoon/init.lua

# Link the files in /bin folder
for file in $(ls -p $DIR/bin | grep -v /)
do
    if [ -f "$DIR/bin/$file" ]; then
        echo "Linking bin $file"
        sudo ln -sfv $DIR/bin/$file /usr/local/bin/$file
    fi
done

# Set macos defaults
chmod a+x $DIR/set-defaults.sh && $DIR/set-defaults.sh

# Install homebrew
chmod a+x $DIR/homebrew/install.sh && $DIR/homebrew/install.sh

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

brew install hammerspoon
brew install --appdir="/Applications" google-chrome
brew install --appdir="/Applications" slack
brew install --appdir="/Applications" iterm2
brew install --appdir="/Applications" visual-studio-code
brew install minikube

brew cleanup
# ---------- END BREW --------

