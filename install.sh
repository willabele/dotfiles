#!/bin/bash

HOMEBREW=/usr/local/bin/brew
DOTFILES=`pwd`

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

ln -s $DOTFILES/.bashrc $HOME/
ln -s $DOTFILES/.bash_profile $HOME/
ln -s $DOTFILES/.gitconfig $HOME/

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

# Vim config
ln -s $DOTFILES/.vimrc $HOME/.vimrc
if [ ! -e $HOME/.vim/bundle/Vundle.vim ]
then
	mkdir -p $HOME/.vim/bundle
	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

vim +PluginInstall +qall
vim +GoInstallBinaries +qall

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

# Seil for remapping caps lock to escape
# open System Preferences > Keyboard > Modifier Keys... and change caps lock 
# configuration to No Action.
brew cask install seil

brew install python
pip install git+git://github.com/Lokaltog/powerline

if [ ! -e z ]
then
    git clone https://github.com/rupa/z.git
fi
