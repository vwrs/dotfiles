export LANG=ja_JP.UTF-8
# apps
# --------------
# homebrew-cask
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
# programming languages
# --------------
# go
if [ -x "`which go`" ]; then
        export GOROOT=`go env GOROOT`
        export GOPATH=$HOME/.go
        export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
fi

