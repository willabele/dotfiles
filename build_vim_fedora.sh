#! /bin/bash

./configure --prefix=$(HOME) --with-features=huge --enable-gui=gnome2 --enable-multibyte --enable-luainterp
yum-builddep vim-X11
git clone https://github.com/nschloe/vim.git
cd vim
git fetch --tags
git checkout tags/v7-4-508
./configure --prefix=$HOME --with-features=huge --enable-gui=gnome2 --enable-multibyte --enable-luainterp --enable-pythoninterp --enable-rubyinterp
make
make install
pip install --user powerline-status
