# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

DOTFILES=$HOME/.dotfiles
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export PATH=$HOME/bin:$PATH
export GOPATH=$HOME/projects/go
if [[ -e ~/.friendlyname ]]
then
    export HOSTNAME=`cat .friendlyname`
else
    if uname -a | grep Darwin
    then
        export HOSTNAME=`scutil --get ComputerName`
    else
        export HOSTNAME=`hostname`
    fi
fi

export PS1='\[\e[0;32m\]${HOSTNAME}\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] '

source $HOME/etc/z/z.sh
alias c="git --git-dir=$DOTFILES --work-tree=$HOME"
alias u="cd .."
alias vib="vim ~/.bashrc"
alias sob="source ~/.bashrc"
alias cap="xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'"
alias git-tossh="git remote set-url origin `git remote -v | grep origin \
    |tail -n 1 | egrep -E -o "github.com[^ ]+" | \
    sed -e 's/github.com\//git\@github.com:/' | sed -e 's/$/.git/'`"
mc() {
    mkdir -p $1
    cd $1
}

export DOCKER_TLS_VERIFY=1
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/rwabele/.boot2docker/certs/boot2docker-vm

shopt -s dotglob
