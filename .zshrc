# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle :compinstall filename '/home/bagofnothing/.zshrc'

autoload -Uz compinit
compinit

# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=2000
SAVEHIST=2000
bindkey -e
# End of lines configured by zsh-newuser-install

# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="random"
ZSH_THEME_RANDOM_QUIET=true

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
 DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
 ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
 COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='emacsclient -t'
 else
   export EDITOR='emacsclient -t'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
 # Example aliases

 alias zshconfig="emacsclient -t ~/.zshrc"
 alias ohmyzsh="emacsclient -t ~/.oh-my-zsh"

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
alias tinstl='trizen -S' # install using trizen
alias tupdate='trizen -Syu' #update using trizen
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
alias ls='exa -l --color=always --group-directories-first' # preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -al --color=always --group-directories-first'  # long format
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

# Emacs fluffs
alias sumacs="sudo emacsclient -t"
alias macs="emacsclient -t"
alias stop="systemctl --user stop emacs"
alias start="systemctl --user start emacs"
alias reload="systemctl --user daemon-reload"

# Alacritty theme through Gogh, if I feel like it
function gogh() {
	bash -c "$(wget -qO- https://git.io/vQgMr)"
}

# Spotify hidpi & no holdup
function spo () {
	nohup spotify --force-device-scale-factor=2 &
}


ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh
