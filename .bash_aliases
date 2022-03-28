# Props to https://gist.github.com/zachbrowne/8bc414c9f30192067831fafebd14255c for most of this


alias dotfiles='/usr/bin/git --git-dir=/home/chris/.dotfiles/ --work-tree=/home/chris'

####################
#     GENERAL      #
####################

# Change directory aliases
alias home='cd ~'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# cd to previous directory
alias bd='cd "$OLDPWD"'

# remove a directory and all files
alias rmd='/bin/rm --recursive --force --verbose'

# directory listing commands
alias la='ls -Alh' #hidden files
alias ls='ls -aFh --color=always' #add colours and file types
alias lx='ls -lXBh' #sort by extension
alias lk='ls -lSrh' #sort by filesize

# search history
alias h='history | grep '

#search runninng processes
alias p='ps aux | grep '
alias topcpu='/bin/ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10'

#check ports
alias openports='netstat -nape --inet'

#check disk space
alias diskspace='du -S | sort -n -r |more'
alias folders='du -h --max-depth=1'
alias folderssorted='find . -maxdepth 1 type d -print0 | xargs -0 du -sk | sort -rn'

# archives
alias mktar='tar -cvf'
alias mkbz2='tar -cvjf'
alias mkgz='tar -cvxf'
alias untar='tar -xvf'
alias unbz2='tar -xvjf'
alias ungz='tar -xvzf'

# alias vim
alias vi='nvim'
alias vim='nvim'
alias svi='sudo nvim'

# alias chmod
alias mx='chmod a+x'

alias 000='chmod -R 000'
alias 644='chmod -R 644'
alias 666='chmod -R 666'
alias 755='chmod -R 755'
alias 777='chmod -R 777'


