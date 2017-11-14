# Path to your oh-my-zsh installation.
export TERM=xterm
ZSH=/usr/share/oh-my-zsh/

DIR="$(dirname "$(readlink -f ~/.zshrc)")"

source "$HOME/antigen.zsh"

## Antigen ##
antigen use oh-my-zsh

antigen bundle git
antigen bundle pip
antigen bundle command-not-found
antigen bundle docker
antigen bundle docker-compose
antigen bundle pass
antigen bundle z

antigen bundle zsh-users/zsh-syntax-highlighting
# antigen theme candy
antigen theme sunrise

antigen apply

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git mercurial docker docker-compose thefuck vagrant)

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH

# Add chefdk gems to the PATH
# export PATH=$HOME/.chefdk/gem/ruby/2.1.0/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export EDITOR=vim

# Compilation flags
# export ARCHFLAGS="-arch x86_64"


# Few those commands were so long
alias dc="docker-compose"
# alias kcf="kubectl create -f"
# alias kdf="kubectl delete -f"
# alias kaf="kubectl apply -f"
# source <(kubectl completion zsh)
# source <(kops completion zsh)

# Work related, shouldn't be added to SCM
source "$DIR/.private_zshrc"

# Multiple monitor shortcuts (home, office, shared prez for VGA and HDMI)
alias scr-home="xrandr --output DP1 --auto --left-of eDP1"
alias scr-rythm="xrandr --output DP1 --auto --above eDP1 --output HDMI2 --auto --right-of DP1"
alias scr-laptop="xrandr --output DP1 --off --output HDMI2 --off"
alias scr-update="~/.rcfiles/reconfigure_screens.sh"

alias tcurl="watch -n1 curl -w "@curl-format.txt" -o /dev/null -s"

alias scratchme="i3-msg move scratchpad"
alias xr="xset r rate 200"

alias bar="(killall polybar && MONITOR=eDP1 nohup polybar top & MONITOR=HDMI1 nohup polybar top & MONITOR=VGA1 nohup polybar top &)"

# Launching sway
export XKB_DEFAULT_MODEL=tm2030USB-106 # TypeMatrix
export XKB_DEFAULT_LAYOUT=us
export XKB_DEFAULT_VARIANT=dvp
export XKB_DEFAULT_OPTIONS=compose:ralt

export WLC_DRM_DEVICE=card0
export WLC_BUFFER_API=GBM
export WLC_BG=0
# if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
#   exec sway
# fi


