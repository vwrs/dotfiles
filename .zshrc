# oh-my-zsh
# ===================================
export ZSH=~/.oh-my-zsh
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=31

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

# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git)
DEFAULT_USER="hideaki"
source $ZSH/oh-my-zsh.sh

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
alias zshconfig="mate ~/.zshrc"
# git
alias gstat="git status"
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
# ruby(rails)
alias be="bundle exec"
# functions
# --------------
# cd
function cdls(){
  \cd "$1" && ls
}
alias cd=cdls
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
# jupyter
alias j="jupyter"
