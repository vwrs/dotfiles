export LANG=ja_JP.UTF-8
# vim
export XDG_CONFIG_HOME=~/.config
# less
export LESS="-Rgj10 --no-init --quit-if-one-screen --RAW-CONTROL-CHARS"
# go
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin
if [ -x "`which go`" ]; then
  export GOROOT=`go env GOROOT`
  export PATH=$PATH:$GOROOT/bin
fi
# fzf
if [ -x "`which rg`" ]; then
  export FZF_DEFAULT_COMMAND="rg --files --no-ignore --hidden --follow -g '!{.git}/*' 2> /dev/null"
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  bind -x '"\C-v": vim $(fzf);'
fi

# OS dependent
# --------------
if [ "$(uname)" = "Darwin" ]; then
  # homebrew-cask
  export HOMEBREW_CASK_OPTS="--appdir=/Applications"
  # homebrew
  export PATH="/usr/local/sbin:$PATH"
  # brew-file
  export HOMEBREW_BREWFILE=~/dotfiles/.brewfile
  # git
  export PATH="/usr/local/share/git-core/contrib/diff-highlight:$PATH"
  # tig(--with-docs, docbooks, asciidoc)
  export XML_CATALOG_FILES=/usr/local/etc/xml/catalog
  # pyenv
  if [ -x "`which pyenv`" ]; then
    export PYENV_ROOT="$HOME/.pyenv"
    if [ "$(hostname)" = "Hideaki" ]; then
      # less
      export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"
    else  # lab
      export PATH="$PYENV_ROOT/bin:$PATH"
      eval "$(pyenv init -)"
    fi
  fi
else
  # lab
  # --------------
  export PATH=/usr/local/cuda/bin:$PATH
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
  # cuda
  # --------------
  export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH
  export LIBRARY_PATH=/usr/local/cuda/lib64:$LIBRARY_PATH
  export CUDA_HOME=/usr/local/cuda
  export CPATH=/usr/local/cuda/include:$CPATH
fi
