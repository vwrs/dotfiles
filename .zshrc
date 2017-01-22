# zplug
# ===================================
DEFAULT_USER="hideaki" # for agnoster
source ~/.zplug/init.zsh

# zplug "lib/clipboard", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-completions"
# themes
# --------------
# zplug "frmendes/geometry"
zplug "caiogondim/bullet-train-oh-my-zsh-theme", as:theme
BULLETTRAIN_PROMPT_ORDER=(
 time status custom context virtualenv dir git hg cmd_exec_time
)
BULLETTRAIN_PROMPT_CHAR=⚡
# BULLETTRAIN_PROMPT_CHAR=💩
# BULLETTRAIN_PROMPT_CHAR=😈
# BULLETTRAIN_PROMPT_CHAR=🙃
# BULLETTRAIN_PROMPT_CHAR=\$
BULLETTRAIN_TIME_BG=black
BULLETTRAIN_CONTEXT_DEFAULT_USER=hideaki
if [ "$(hostname)" != "Hideaki" ]; then
  BULLETTRAIN_IS_SSH_CLIENT=true
fi
BULLETTRAIN_GIT_COLORIZE_DIRTY=true
BULLETTRAIN_GIT_BG=green
BULLETTRAIN_GIT_COLORIZE_DIRTY_BG_COLOR=yellow

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  printf "Install(zplug)? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load --verbose

# User configuration
# ===================================
# zsh
# --------------
bindkey -e
bindkey '^R' history-incremental-pattern-search-backward
autoload -Uz colors; colors
autoload -Uz compinit; compinit -u
setopt correct
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
fpath=(/usr/local/share/zsh-completions $fpath)
# vi mode
# --------------
# bindkey -M viins '^j' vi-cmd-mode
# bindkey '^P' up-history
# bindkey '^N' down-history
# bindkey '^?' backward-delete-char
# bindkey '^h' backward-delete-char
# bindkey '^w' backward-kill-word
# function zle-line-init zle-keymap-select {
#     VIM_NORMAL="%K{208}%F{black}⮀%k%f%K{208}%F{white} % NORMAL %k%f%K{black}%F{208}⮀%k%f"
#     VIM_INSERT="%K{075}%F{black}⮀%k%f%K{075}%F{white} % INSERT %k%f%K{black}%F{075}⮀%k%f"
#     RPS1="${${KEYMAP/vicmd/$VIM_NORMAL}/(main|viins)/$VIM_INSERT}"
#     # RPS2=$RPS1
#     zle reset-prompt
# }
# zle -N zle-line-init
# zle -N zle-keymap-select
# export KEYTIMEOUT=1
# --------------
# ls
export LSCOLORS=Cxfxcxdxbxegedabagacad
# export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors 'di=32' 'ex=31'

# commands
# --------------
if [ -x "`which tree`" ]; then
  alias tree="tree -aC"
fi
if [ -x "`which fzf`" ]; then
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
fi
if [ -x "`which pyenv`" ]; then
  eval "$(pyenv init -)"
fi
# LaTeX
alias lualatex="lualatex --file-line-error --synctex=1"
alias latexmk="latexmk -pvc"
# aliases
# --------------
alias sudo="sudo -E "
alias v="vim"
# git
alias g="git"
# rm, cp, mv
alias rm="rm -i"
alias cp="cp -vi"
alias mv="mv -vi"
# ls
alias ll="ls -lhtr"
alias ll.='ls -ldhtr .*'
# mkdir
alias mkdir="mkdir -p"
# OS dependent
# --------------
if [ "$(uname)" = "Darwin" ]; then
  alias ls='ls -tGAF'
  alias l.='ls -d .*'
  alias htop="sudo htop"
  alias unko="say うんこ | echo うんこ"
  # brew-file
  if [ -f $(brew --prefix)/etc/brew-wrap ];then
    source $(brew --prefix)/etc/brew-wrap
  fi
  # iTerm2
  source ~/.iterm2_shell_integration.zsh
  alias it2dl="~/.iterm2/it2dl"
  alias imgcat="~/.iterm2/imgcat"
  # meshi
  alias meshi="ruby /Users/hideaki/programs/densei/who.rb; ruby /Users/hideaki/programs/densei/where_to_go.rb"
  alias brew="env PATH=${PATH/${HOME}\/\.pyenv\/shims:/} brew"
  # muratalab
  alias muratadssh="ssh -D 10080 murata"
  alias wasedassh="ssh 1y14f0496@muse01.mse.waseda.ac.jp"
else
  alias ls='ls -tAF --color=auto'
fi
# programming languages
# --------------
# php
alias phpi="php -a"
# rails
alias be="bundle exec"
# functions
# --------------
# cd
# function cdls(){
#   \cd "$1" && ls
# }
# alias cd=cdls
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
# jupyter
alias j="jupyter"
