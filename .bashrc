# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

DOTFILES=$HOME/.dotfiles
export PATH=$HOME/.local/bin:$HOME/bin:$PATH
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

export EDITOR=vim
export PS1='\[\e[0;32m\]${HOSTNAME}\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] '
source $HOME/etc/z/z.sh
alias c="GIT_AUTHOR_EMAIL='will@willabele.com' GIT_AUTHOR_NAME='Will Abele' git --git-dir=$DOTFILES --work-tree=$HOME"
alias pgit="GIT_AUTHOR_EMAIL='will@willabele.com' GIT_AUTHOR_NAME='Will Abele' git"
alias u="cd .."
alias vib="vim ~/.bashrc"
alias sob="source ~/.bashrc"
alias cap="xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'"
alias waketime='pmset -g log |grep -E "Kernel Idle sleep preventers: (-None-|IODisplayWrangler)" |tail -n20'

function sshagent_findsockets {
    find /tmp -uid $(id -u) -type s -name agent.\* 2>/dev/null
}

function sshagent_testsocket {
    if [ ! -x "$(which ssh-add)" ] ; then
        echo "ssh-add is not available; agent testing aborted"
        return 1
    fi

    if [ X"$1" != X ] ; then
        export SSH_AUTH_SOCK=$1
    fi

    if [ X"$SSH_AUTH_SOCK" = X ] ; then
        return 2
    fi

    if [ -S $SSH_AUTH_SOCK ] ; then
        ssh-add -l > /dev/null
        if [ $? = 2 ] ; then
            echo "Socket $SSH_AUTH_SOCK is dead!  Deleting!"
            rm -f $SSH_AUTH_SOCK
            return 4
        else
            echo "Found ssh-agent $SSH_AUTH_SOCK"
            return 0
        fi
    else
        echo "$SSH_AUTH_SOCK is not a socket!"
        return 3
    fi
}

function sshagent_init {
    # ssh agent sockets can be attached to a ssh daemon process or an
    # ssh-agent process.

    AGENTFOUND=0

    # Attempt to find and use the ssh-agent in the current environment
    if sshagent_testsocket ; then AGENTFOUND=1 ; fi

    # If there is no agent in the environment, search /tmp for
    # possible agents to reuse before starting a fresh ssh-agent
    # process.
    if [ $AGENTFOUND = 0 ] ; then
        for agentsocket in $(sshagent_findsockets) ; do
            if [ $AGENTFOUND != 0 ] ; then break ; fi
            if sshagent_testsocket $agentsocket ; then AGENTFOUND=1 ; fi
        done
    fi

    # If at this point we still haven't located an agent, it's time to
    # start a new one
    if [ $AGENTFOUND = 0 ] ; then
        eval `ssh-agent`
    fi

    # Clean up
    unset AGENTFOUND
    unset agentsocket

    # Finally, show what keys are currently in the agent
    ssh-add -l
}

alias sagent="sshagent_init"

n() {
    vim ~/od/notes/$1
}
mc() {
    mkdir -p $1
    cd $1
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
shopt -s dotglob
# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
alias base16='eval "$($BASE16_SHELL/profile_helper.sh)"'
