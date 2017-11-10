```bash
cd ~
git clone --separate-git-dir=$HOME/.dotfiles \
  https://github.com/willabele/dotfiles
rsync -av dotfiles/ ./
rm -rf dotfiles
```
