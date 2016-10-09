# oh-my-zsh
# ===================================
export ZSH=/Users/hideaki/.oh-my-zsh
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
bindkey -v
bindkey '^R' history-incremental-pattern-search-backward
autoload -Uz colors; colors
autoload -Uz compinit; compinit
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

# apps
# --------------
# iTerm2
source ~/.iterm2_shell_integration.`basename $SHELL`
alias it2dl="~/.iterm2/it2dl"
alias imgcat="~/.iterm2/imgcat"
# homebrew-cask
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
# aliases
# --------------
alias zshconfig="mate ~/.zshrc"
# rm, cp, mv
alias rm="rm -i"
alias cp="cp -vi"
alias mv="mv -vi"
# cd
function cdls(){
  \cd "$1" && ls
}
alias cd=cdls
# ls
alias ll="ls -lhtr"
alias ll.='ls -ldhtr .*'
# mkdir
alias mkdir="mkdir -p"
# tree
alias tree="tree -aC"
# unko
alias unko="say うんこ | echo 'うんこ'"
# OS dependent
# --------------
if [ "$(uname)" = "Darwin" ]; then
  alias ls='ls -tGAF'
  alias l.='ls -d .*'
  alias htop="sudo htop"
else
  alias ls='ls -tAF --color=auto'
fi
# programming languages
# --------------
# php
alias phpi="php -i"
# ruby(rails)
alias be="bundle exec"
# functions
# --------------
# cd
function cdls(){
  \cd "$1" && ls
}
alias cd=cdls

