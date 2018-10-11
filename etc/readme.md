```bash
cd ~
git clone --separate-git-dir=$HOME/.dotfiles git@github.com:willabele/dotfiles
rsync -av dotfiles/ ./
rm -rf dotfiles

if [[ ! -e ~/.vimrc ]]
then
    echo "runtime vimrc" > ~/.vimrc
fi

if [[ ! -e ~/.vim ]]
then
    git clone git@github.com:willabele/vimfiles ~/.vim
fi

```
