if [ -x "`which tree`" ]; then
  alias tree="tree -aC -I '.git|.DS_Store'"
fi
if [ -d ~/.fzf ]; then
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
fi
if [ -x "`which rg`" ]; then
  export FZF_DEFAULT_COMMAND="rg --files --hidden --follow -g '!{.git}/*' 2> /dev/null"
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fi

if [ -x "`which tmux`" ]; then
  alias ta="tmux a"
  alias tl="tmux ls"
  alias tks="tmux kill-server"
fi
if [ -x "`which convert`" ]; then
  img2pdf () {
    for f in *.(png|jpg); do
      convert $f ${f%.*}.pdf
    done
  }
fi
if [ -d ~/.iterm2 ]; then
  source ~/.iterm2_shell_integration.zsh
  alias it2dl="~/.iterm2/it2dl"
  alias imgcat="~/.iterm2/imgcat"
  alias imgls="~/.iterm2/imgls"
fi
if [ -x "`which lualatex`" ]; then
  alias lualatex="lualatex --file-line-error --synctex=1"
fi
if [ -x "`which luajittex`" ]; then
  alias luajitlatex="luajittex --fmt=luajitlatex.fmt"
fi

