export LANG=ja_JP.UTF-8
# vim
export XDG_CONFIG_HOME=~/.config
# programming languages
# --------------
# go
if [ -x "`which go`" ]; then
  export GOROOT=`go env GOROOT`
  export GOPATH=$HOME/.go
  export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
fi
# pyenv
# --------------
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/shims:$PATH"
# less
# --------------
export LESS="-Rgj10 --no-init --quit-if-one-screen --RAW-CONTROL-CHARS"
# OS dependent
# --------------
if [ "$(uname)" = "Darwin" ]; then
  # homebrew-cask
  export HOMEBREW_CASK_OPTS="--appdir=/Applications"
  # homebrew
  export PATH="/usr/local/sbin:$PATH"
  # brew-file
  export HOMEBREW_BREWFILE=~/dotfiles/.brewfile
  # less
  # --------------
  export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"
  # git
  # --------------
  export PATH="/usr/local/share/git-core/contrib/diff-highlight:$PATH"
  # tensorflow
  # --------------
  # CPU only ver.
  export TF_BINARY_URL=https://storage.googleapis.com/tensorflow/mac/cpu/tensorflow-0.11.0-py3-none-any.whl
else
  # lab
  # --------------
  export PATH=/usr/local/cuda/bin:$PATH
  export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH
fi
