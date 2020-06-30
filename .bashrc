#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
export PATH="/home/bagofnothing/.gem/ruby/2.7.0/bin"
PATH=$PATH:/sbin
alias dots='/usr/bin/git --git-dir=/home/bagofnothing/.dotfiles/ --work-tree=/home/bagofnothing'
alias config='/usr/bin/git --git-dir=/home/bagofnothing/.cfg/ --work-tree=/home/bagofnothing'
