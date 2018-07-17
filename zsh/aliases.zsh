alias sudo="sudo -E"
alias v="vim"
alias n="nvim"
alias gv="gvim"
# git
alias g="git"
# cd
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
# rm, cp, mv
alias rm="rm -i"
alias cp="cp -vi"
alias mv="mv -vi"
# ls
alias ll="ls -lhtr"
alias ll.="ls -ldhtr .*"
alias lsd="ls -F | \grep / | tr '\n' '\t'"
alias lsf="ls -F | \grep -v / | tr '\n' '\t'"
# mkdir
alias mkdir="mkdir -p"
# grep
alias grep="grep -in --color"
# ssh
alias sshj="ssh -L 9000:127.1:9000"
alias sshvnc="ssh -L 5900:127.1:5900"
# git
alias gs="git status -sb"
# docker
alias d="docker"
alias dc="docker-compose"
# programming languages
# --------------
# php
alias phpi="php -a"
# rails
alias be="bundle exec"

