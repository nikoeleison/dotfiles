# @author nikoeleison
# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

#--- fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
source ~/.cache/wal/colors.sh

#--- go
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/Documents/Workspace/go
