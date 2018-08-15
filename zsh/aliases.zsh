alias sudo="sudo -E"
alias v="vim"
alias n="nvim"
# git
if [ -x `which hub` ]; then
  alias g="hub"
else
  alias g="git"
fi
alias gs="git status -sb"
alias gd="git diff"
# ls
alias ll="ls -lhtr"
alias ll.="ls -ldhtr .*"
alias lsd="ls -F | \grep / | tr '\n' '\t'"
alias lsf="ls -F | \grep -v / | tr '\n' '\t'"
# cd
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
# other builtin commands
alias rm="rm -i"
alias cp="cp -vi"
alias mv="mv -vi"
alias ln="ln -v"
alias mkdir="mkdir -p"
alias grep="grep -in --color"
# ssh
alias sshj="ssh -L 9000:127.1:9000"
alias sshvnc="ssh -L 5900:127.1:5900"
# docker
alias d="docker"
alias dc="docker-compose"
# programming languages
# --------------
# php
alias phpi="php -a"
# rails
alias be="bundle exec"

