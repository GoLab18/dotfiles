#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

###-------- ALIASES --------###

alias la="ls -lAtrih"

###-------- STARSHIP --------###

eval "$(starship init bash)"

###-------- NVM --------###

source /usr/share/nvm/init-nvm.sh


# Load Angular CLI autocompletion.
source <(ng completion script)
