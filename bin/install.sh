#!/bin/bash

HOMEBREW=/usr/local/bin/brew
DOTFILES=`pwd`

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Install Homebrew
if [ ! `which brew` ]
then
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure brew is working
brew update
brew doctor
if (( $? ))
then
	echo "Brew doctor failed. Is Xcode happy?"
	exit 1
fi

brew install mercurial

# Macvim with lua support
brew install macvim --with-cscope --with-lua --override-system-vim

# Cask for installing OS X apps
brew install caskroom/cask/brew-cask

# Chrome
brew cask install google-chrome

# Google drive
brew cask install google-drive

# Dropbox
brew cask install dropbox

brew cask install radiant-player

brew install wget

brew install ag

# Seil for remapping caps lock to escape
# open System Preferences > Keyboard > Modifier Keys... and change caps lock 
# configuration to No Action.
brew cask install seil

brew install python
