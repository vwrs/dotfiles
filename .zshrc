# zplug
# ===================================
source ~/.zplug/init.zsh

zplug "zplug/zplug", hook-build:"zplug --self-manage"
# zplug "lib/clipboard", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-completions"
zplug "erikw/tmux-powerline"
zplug "greymd/tmux-xpanes"

# themes
# --------------
# zplug "frmendes/geometry", as:theme
# zplug "denysdovhan/spaceship-zsh-theme", as:theme
# zplug "lenguyenthanh/nt9-oh-my-zsh-theme", as:theme
zplug "caiogondim/bullet-train-oh-my-zsh-theme", as:theme
# random theme
# themes=("frmendes/geometry" "lenguyenthanh/nt9-oh-my-zsh-theme" "caiogondim/bullet-train-oh-my-zsh-theme")
# N=${#themes[@]}
# ((N=(RANDOM%N)+1))
# RANDOM_THEME=${themes[$N]}
# zplug $RANDOM_THEME, as:theme
BULLETTRAIN_PROMPT_ORDER=(time status custom context dir git hg cmd_exec_time)
# BULLETTRAIN_PROMPT_CHAR="╚═>>>"
# BULLETTRAIN_PROMPT_CHAR="%F{red}»%F{green}»%F{white}»%f"
# BULLETTRAIN_PROMPT_CHAR="%F{red}➤%F{green}➤%F{white}➤ %f"
BULLETTRAIN_PROMPT_CHAR="%F{red}>%F{green}>%F{white}>%f"

BULLETTRAIN_TIME_BG=white
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

zplug load

# User configuration
# ===================================
# zsh
# --------------
bindkey -e
bindkey '^R' history-incremental-pattern-search-backward
autoload -Uz colors; colors
autoload -Uz compinit; compinit -u
zmodload zsh/complist
setopt correct
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
# setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
# completion
# --------------
unsetopt menu_complete   # do not autoselect the first completion entry
unsetopt flowcontrol
setopt auto_menu         # show completion menu on successive tab press
setopt complete_in_word
setopt always_to_end
bindkey -M menuselect '^o' accept-and-infer-next-history
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories

HISTFILE=~/.zsh_history
HISTSIZE=77777
SAVEHIST=77777
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
  eval "$(pyenv virtualenv-init -)"
fi
if [ -x "`which jupyter`" ]; then
  alias j="jupyter"
fi
if [ -x "`which tmux`" ]; then
  alias ta="tmux a"
  alias tl="tmux ls"
  alias tks="tmux kill-server"
fi
if [ -x "`which pip`" ]; then
  function _pip_completion {
    local words cword
    read -Ac words
    read -cn cword
    reply=( $( COMP_WORDS="$words[*]" \
               COMP_CWORD=$(( cword-1 )) \
               PIP_AUTO_COMPLETE=1 $words[1] ) )
  }
  compctl -K _pip_completion pip
fi
if [ -d ~/.iterm2 ]; then
  source ~/.iterm2_shell_integration.zsh
  alias it2dl="~/.iterm2/it2dl"
  alias imgcat="~/.iterm2/imgcat"
  alias imgls="~/.iterm2/imgls"
fi

# LaTeX
alias lualatex="lualatex --file-line-error --synctex=1"
alias latexmk="latexmk -pvc"
alias luajitlatex="luajittex --fmt=luajitlatex.fmt"
# aliases
# --------------
alias sudo="sudo -E "
alias v="vim"
alias n="nvim"
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
# programming languages
# --------------
# python
alias py="python"
# php
alias phpi="php -a"
# rails
alias be="bundle exec"
# OS dependent
# --------------
if [ "$(uname)" = "Darwin" ]; then
  fpath=(/usr/local/share/zsh-completions $fpath)
  alias ls="ls -tGAF"
  alias l.="ls -d .*"
  alias du="du -ch"
  alias htop="sudo htop"
  alias unko="say うんこ | echo うんこ"
  # brew-file
  if [ -f $(brew --prefix)/etc/brew-wrap ];then
    source $(brew --prefix)/etc/brew-wrap
  fi

  alias brew="env PATH=${PATH/${HOME}\/\.pyenv\/shims:/} brew"
  alias sockson="networksetup -setsocksfirewallproxystate Ethernet on"
  alias socksoff="networksetup -setsocksfirewallproxystate Ethernet off"

  # upgrade homebrew-cask
  brew-cask-upgrade () {
    for app in $(brew cask list); do
      local latest="$(brew cask info "${app}" | awk 'NR==1{print $2}')";
      local versions=($(ls -1 "/usr/local/Caskroom/${app}/.metadata/"));
      local current=$(echo ${versions} | awk '{print $NF}');
      if [[ "${latest}" = "latest" ]]; then
        echo "[!] ${app}: ${current} == ${latest}";
        [[ "$1" = "-f" ]] && brew cask install "${app}" --force;
        continue;
      elif [[ "${current}" = "${latest}" ]]; then
        continue;
      fi;
      echo "[+] ${app}: ${current} -> ${latest}";
      brew cask uninstall "${app}" --force;
      brew cask install "${app}";
    done;
  }
else
  alias ls="ls -tAF --color=auto"
  alias du="du -bch --time"
  alias smi="nvidia-smi"
fi
