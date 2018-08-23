# builtin commands
# ----------
alias sudo="sudo -E"
alias ll="ls -lhtr"
alias ll.="ls -ldhtr .*"
alias lsd="ls -F | \grep / | tr '\n' '\t'"
alias lsf="ls -F | \grep -v / | tr '\n' '\t'"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias rm="rm -i"
alias cp="cp -vi"
alias mv="mv -vi"
alias ln="ln -v"
alias mkdir="mkdir -p"
alias grep="grep -in --color"
# ssh
alias sshj="ssh -L 9000:127.1:9000"
alias sshvnc="ssh -L 5900:127.1:5900"

# non-builtin commands
# ----------
if [ -x "`which vim`" ]; then
  alias v="vim"
fi
if [ -x "`which nvim`" ]; then
  alias n="nvim"
fi
if [ -x "`which git`" ]; then
  alias g="git"
  alias gs="git status -sb"
  alias gd="git diff"
fi
if [ -x "`which docker`" ]; then
  alias d="docker"
  alias dc="docker-compose"
fi
if [ -x "`which tree`" ]; then
  alias tree="tree -aC -I '.git|.DS_Store'"
fi
if [ -x "`which tmux`" ]; then
  alias ta="tmux a"
  alias tl="tmux ls"
  alias tks="tmux kill-server"
fi
if [ -x "`which lualatex`" ]; then
  alias lualatex="lualatex --file-line-error --synctex=1"
fi
if [ -x "`which luajittex`" ]; then
  alias luajitlatex="luajittex --fmt=luajitlatex.fmt"
fi

# programming languages
# ----------
# php
alias phpi="php -a"
# rails
alias be="bundle exec"

