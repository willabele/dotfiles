DOTFILES=$HOME/projects/dotfiles
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export GOPATH=$HOME/projects/go
export PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] '

source $DOTFILES/z/z.sh
alias u="cd .."
alias vib="vim ~/.bashrc"
alias sob="source ~/.bashrc"
