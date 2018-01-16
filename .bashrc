# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

DOTFILES=$HOME/.dotfiles
export PATH=$HOME/bin:$PATH
if [[ -e ~/.friendlyname ]]
then
    export HOSTNAME=`cat .friendlyname`
else
    if uname -a | grep Darwin > /dev/null 2>&1
    then
        export HOSTNAME=`scutil --get ComputerName`
    else
        export HOSTNAME=`hostname`
    fi
fi

export EDITOR=vim
export PS1='\[\e[0;32m\]${HOSTNAME}\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] '
source $HOME/etc/z/z.sh
alias c="GIT_AUTHOR_EMAIL='will@willabele.com' GIT_AUTHOR_NAME='Will Abele' git --git-dir=$DOTFILES --work-tree=$HOME"
alias u="cd .."
alias vib="vim ~/.bashrc"
alias sob="source ~/.bashrc"
alias cap="xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'"
alias waketime='pmset -g log |grep "Kernel Idle sleep preventers: IODisplayWrangler" |tail -n10'

n() {
    vim ~/od/notes/$1
}
mc() {
    mkdir -p $1
    cd $1
}

shopt -s dotglob
