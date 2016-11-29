export LANG=ja_JP.UTF-8
# ls
export LSCOLORS=Cxfxcxdxbxegedabagacad
# export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors 'di=32' 'ex=31'
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
fi
