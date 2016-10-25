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
  # less
  # --------------
  export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"
  # git
  # --------------
  export PATH="/usr/local/share/git-core/contrib/diff-highlight:$PATH"
fi
