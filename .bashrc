# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

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

# MacOS Specific
if uname -a | grep Darwin > /dev/null 2>&1
then
    if [[ `which mvim` ]]
    then
        alias vim="mvim -v"
    fi
fi

export PS1='\[\e[0;32m\]${HOSTNAME}\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] '
source $HOME/etc/z/z.sh
alias u="cd .."
alias vib="vim ~/.bashrc"
alias sob="source ~/.bashrc"
alias waketime='pmset -g log |grep -E "Kernel Idle sleep preventers: (-None-|IODisplayWrangler)" |tail -n20'



n() {
    vim ~/od/notes/$1
}

install_nvim_ubuntu() {
    sudo apt-get install python-dev python-pip python3-dev python3-pip
    sudo add-apt-repository ppa:neovim-ppa/stable
    sudo apt-get update
    sudo apt-get install neovim
    sudo apt install python-neovim
    sudo apt install python3-neovim
}

install_docker_ubuntu() {
    sudo apt-get install curl
    curl -fsSL https://get.docker.com | sh
    sudo usermod -aG docker $(id -n -u)
}

source ${HOME}/.config/extras/*.sh
source ${HOME}/.common_env.sh
shopt -s dotglob
