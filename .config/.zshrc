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
HISTSIZE=10000
SAVEHIST=10000

setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY

# Path Config

setopt extended_glob null_glob

path=(
	$path
	$HOME/bin
	$HOME/.local/bin
	/opt/homebrew/bin
	/usr/local/bin
	/root/.local/bin
)

typeset -U path
path=($^path(N-/))

export PATH

## Dev container specific
if [ -d "/home/linuxbrew/.linuxbrew" ]; then
	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# Keybindings
#

bindkey "^F" history-incremental-search-forward
bindkey "^R" history-incremental-search-backward
bindkey -M vicmd '?' history-incremental-search-backward
bindkey -M vicmd '/' history-incremental-search-forward

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
alias 666='chmod -R 666'
alias 644='chmod -R 644'
alias 755='chmod -R 755'
alias mx='chmod a+x'

## shortcuts
alias e='exit'
alias t='tmux'
alias pprox='aws-vault --debug exec --server --lazy proddata -- docker compose --project-directory "$DEV_FOLDER/aws-vault/contrib/_aws-vault-proxy" up -d --force-recreate'
alias tprox='aws-vault --debug exec --server --lazy testdata -- docker compose --project-directory "$DEV_FOLDER/aws-vault/contrib/_aws-vault-proxy" up -d --force-recreate'


# Time tracking
alias timecodes='printf "DA-1468 = Standup Meeting;\n DA-1706 = Writing Handover;\n DA-1716 - Conducting Appraisal;\n DA-1717 - Code Review;\n DA-1718 = Context switching;\n DA-1719 = 1to1 Meeting;\n DA-1720 = Access Control Audit;\n DA-1721 = Company Update;\n DA-1722 = Completing timesheets;\n DA-1723 = Jira management\n DA-1802 HR Training / E-Learning\n DA-1812 = Roadmap Meeting"'
alias tracktime='git -C $DEV_FOLDER/smart-commits-time-tracking commit --allow-empty -m'
alias submittime='git -C $DEV_FOLDER/smart-commits-time-tracking push'
alias show-git-branches="git for-each-ref --sort=-committerdate refs/heads/ --format='%(committerdate:iso8601) %(refname:short)"
alias trim-git-branches='git branch -d $(git branch --merged=main | grep -v main)'


# Created by `pipx` on 2024-05-21 12:16:24
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

export PATH="$PATH:/Users/chrisfletcher/.local/bin"

eval "$(direnv hook zsh)"
# Added by dbt Fusion extension
alias dbtf=/Users/chrisfletcher/.local/bin/dbt
