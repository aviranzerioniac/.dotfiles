#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\W]=> '

export PATH=/usr/bin:/home/bagofnothing/.gem/ruby/2.7.0/bin

### Alias for Tasks

## Emacs as the default editor/visual
export EDITOR="emacsclient -t"
export VISUAL="emacsclient -c"

## Remove Duplicate History
export HISTCONTROL=ignoreboth

## QoL Tweaks

# OS Maintenance
alias update='sudo pacman -Syu' # too frequent and too cubersome
alias remove='sudo pacman -Rcs' # uninstall
alias instl='sudo pacman -S' # install
alias pinstl='pamac install' # install using pamac
alias pupdate='pamac checkupdates; pamac update;' #update using pamac
alias unlock="sudo rm /var/lib/pacman/db.lck"    # remove pacman lock
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)' # remove orphaned packages

## Miscl Settings

alias de='setxkbmap de' # keyboard layout to de
alias caps='setxkbmap -layout de -option ctrl:nocaps' # Caps Lock is Control on a keyboard
alias night='redshift -O 4500K' # redshift manual night mode
alias day='redshift -O 7000K' # redshift manual day
alias config='emacsclient -t ~/.config/qtile/config.py' # enables readily editing wm config

alias py='cd Development/python/progs' # going to my python folder

# navigation
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# Anaconda
alias activate='source /opt/anaconda/bin/activate root'
alias deactivate='conda deactivate'

# Changing "ls" to "exa"
alias ls='exa -al --color=always --group-directories-first' # preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.='exa -a | egrep "^\."'

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# git shortcuts
alias addup='git add -u'
alias addall='git add .'
alias branch='git branch'
alias checkout='git checkout'
alias clone='git clone'
alias commit='git commit -m'
alias fetch='git fetch'
alias pull='git pull origin'
alias push='git push origin'
alias status='git status'
alias tag='git tag'
alias newtag='git tag -a'

# shutdown or reboot with systemd
alias ssn="systemctl poweroff"
alias reboot="systemctl reboot"

# Emacs
alias sumacs="sudo emacsclient -t"
alias macs="emacsclient -t"

# systemd aliasiasess
# User
alias ustop="systemctl --user stop"
alias ustart="systemctl --user start"
alias ureload="systemctl --user daemon-reload"
alias uenable="systemctl --user enable"

# System
alias stop="systemctl stop"
alias start="systemctl start"
alias reload="systemctl restart"
alias enable="systemctl enable"
