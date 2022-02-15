if [ -d ~/.fzf ]; then
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
fi
if [ -x "`which rg`" ]; then
  export FZF_DEFAULT_COMMAND="rg --files --hidden --follow -g '!{.git}/*' 2> /dev/null"
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fi

if [ -x "`which convert`" ]; then
  img2pdf () {
    for f in *.(png|jpg|eps); do
      convert $f ${f%.*}.pdf
    done
  }
fi

if [ -x "`which kubectl`" ]; then
  source ${ZSH_HOME}kubectl.zsh
fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
