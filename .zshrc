# zplug
# ===================================
source ~/.zplug/init.zsh

zplug "zplug/zplug", hook-build:"zplug --self-manage"
# zplug "lib/clipboard", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-completions"
zplug "erikw/tmux-powerline"
# themes
# --------------
# zplug "frmendes/geometry", as:theme
# zplug "denysdovhan/spaceship-zsh-theme", as:theme
# zplug "lenguyenthanh/nt9-oh-my-zsh-theme", as:theme
# zplug "caiogondim/bullet-train-oh-my-zsh-theme", as:theme
# random theme
themes=("frmendes/geometry" "lenguyenthanh/nt9-oh-my-zsh-theme" "caiogondim/bullet-train-oh-my-zsh-theme")
N=${#themes[@]}
((N=(RANDOM%N)+1))
RANDOM_THEME=${themes[$N]}
zplug $RANDOM_THEME, as:theme
if [ $N -eq 3 ]; then
  # BULLETTRAIN_PROMPT_ORDER=(time status custom context virtualenv dir git hg cmd_exec_time)
  BULLETTRAIN_PROMPT_ORDER=(time status custom context dir git hg cmd_exec_time)
  BULLETTRAIN_PROMPT_CHAR=⚡
  BULLETTRAIN_TIME_BG=white
  BULLETTRAIN_CONTEXT_DEFAULT_USER=hideaki
  if [ "$(hostname)" != "Hideaki" ]; then
    BULLETTRAIN_IS_SSH_CLIENT=true
  fi
  BULLETTRAIN_GIT_COLORIZE_DIRTY=true
  BULLETTRAIN_GIT_BG=green
  BULLETTRAIN_GIT_COLORIZE_DIRTY_BG_COLOR=yellow
fi

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  printf "Install(zplug)? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

# User configuration
# ===================================
# zsh
# --------------
bindkey -e
bindkey '^R' history-incremental-pattern-search-backward
autoload -Uz colors; colors
autoload -Uz compinit; compinit -u
zstyle ':completion:*' menu select interactive
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
setopt correct
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt menucomplete
HISTFILE=~/.zsh_history
HISTSIZE=77777
SAVEHIST=77777
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
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
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
if [ -x "`which jupyter`" ]; then
  alias j="jupyter"
fi
if [ -x "`which tmux`" ]; then
  alias tks="tmux kill-server"
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
alias ll.='ls -ldhtr .*'
alias lsd="ls -F | grep / | tr '\n' '  '"
alias lsf="ls -F | grep -v / | tr '\n' '  '"
# mkdir
alias mkdir="mkdir -p"
# OS dependent
# --------------
if [ "$(uname)" = "Darwin" ]; then
  fpath=(/usr/local/share/zsh-completions $fpath)
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
  alias sockson="networksetup -setsocksfirewallproxystate Ethernet on"
  alias socksoff="networksetup -setsocksfirewallproxystate Ethernet off"
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
# function cdls(){
#   \cd "$1" && ls
# }
# alias cd=cdls
