#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

###-------- EXPORTS --------###

export EDITOR="vim"

###-------- SSH AGENT --------###

sshdir="$XDG_RUNTIME_DIR/ssh-agent.env"

if [ ! -f $sshdir ]; then
    touch $sshdir
fi

if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 1h > $sshdir
fi

if [ ! -f "$SSH_AUTH_SOCK" ]; then
    source $sshdir > /dev/null
fi

###-------- STARSHIP --------###

eval "$(starship init bash)"

###-------- NVIM --------###

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

##-------- GO --------###

gobin=$(go env GOBIN)
gopath=$(go env GOPATH)

[ -n "$gobin" ] && PATH="$PATH:$gobin"

export PATH="$PATH:$(go env GOPATH)/bin"
