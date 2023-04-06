export LANG=ja_JP.UTF-8
# vim
export XDG_CONFIG_HOME=~/.config
# less
export LESS="-Rgj10 --no-init --quit-if-one-screen --RAW-CONTROL-CHARS"
# rust
if [ -d $HOME/.cargo ]; then
. "$HOME/.cargo/env"
fi
# go
if [ -x "$(which go)" ]; then
  export GOPATH=$HOME/go
  export GOBIN=$GOPATH/bin
  export PATH=$PATH:$GOBIN
fi
