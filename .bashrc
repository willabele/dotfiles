DOTFILES=$HOME/projects/dotfiles
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export PATH=$HOME/bin:$PATH
export GOPATH=$HOME/projects/go
export PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] '

source $DOTFILES/z/z.sh
alias u="cd .."
alias vib="vim ~/.bashrc"
alias sob="source ~/.bashrc"

export DOCKER_TLS_VERIFY=1
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/rwabele/.boot2docker/certs/boot2docker-vm
