# Env variables

# Set vim mode
set -o vi

# Set globals
export VISUAL=nvim
export EDITOR=nvim
export TERM="tmux-256color"
export BROWSER="firefox"
export DEV_FOLDER="$HOME/dev"

# History
HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000

setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY

# Path Config

setopt extended_glob null_glob

path=(
	$path
	$HOME/bin
	$HOME/.local/bin
	/root/.local/bin
)

typeset -U path
path=($^path(N-/))

export PATH

## Dev container specific
if [ -d "/home/linuxbrew/.linuxbrew" ]; then
	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi


# Aliases

## vim
alias v=nvim
alias vim=nvim

#
## ls 
alias ls='ls --color=auto'
alias la='ls -lathr'

## git
alias gp='git pull'
alias gs='git status'
alias lg='lazyygit'

## chmods
alias 000='chmod -R 000'
alias 600='chmod -R 600'
alias 644='chmod -R 644'
alias 666='chmod -R 666'
alias 755='chmod -R 755'
alias mx='chmod a+x'

## shortcuts
alias e='exit'
alias t='tmux'

# Time tracking
alias tracktime='git -C $DEV_FOLDER/smart-commits-time-tracking commit --allow-empty -m'
alias submittime='git -C $DEV_FOLDER/dev/smart-commits-time-tracking push'


# Created by `pipx` on 2024-05-21 12:16:24

autoload -U +X compinit && compinit
export PATH="$PATH:/Users/chrisfletcher/.local/bin"
