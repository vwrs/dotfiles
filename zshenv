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

