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
# OS dependent
# --------------
if [ "$(uname)" = "Darwin" ]; then
  if [ "$(hostname)" = "Hideaki" ]; then
    # less
    export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"
  else  # lab
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
    export PATH=$PYENV_ROOT/versions/anaconda3-4.1.0/bin:$PATH
  fi
  # homebrew-cask
  export HOMEBREW_CASK_OPTS="--appdir=/Applications"
  # homebrew
  export PATH="/usr/local/sbin:$PATH"
  # brew-file
  export HOMEBREW_BREWFILE=~/dotfiles/.brewfile
  # pyenv
  export PYENV_ROOT="$HOME/.pyenv"
  # git
  export PATH="/usr/local/share/git-core/contrib/diff-highlight:$PATH"
  # tig(--with-docs, docbooks, asciidoc)
  export XML_CATALOG_FILES=/usr/local/etc/xml/catalog
else
  # lab
  # --------------
  export PATH=/usr/local/cuda/bin:$PATH
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
  export PATH=$PYENV_ROOT/versions/anaconda3-4.1.0/bin:$PATH
  # cuda
  # --------------
  export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH
  export LIBRARY_PATH=/usr/local/cuda/lib64:$LIBRARY_PATH
  export CUDA_HOME=/usr/local/cuda
  export CPATH=/usr/local/cuda/include:$CPATH
fi
