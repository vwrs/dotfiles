if [ -d ~/.fzf ]; then
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
fi
if (( $+commands[rg] )); then
  export FZF_DEFAULT_COMMAND="rg --files --hidden --follow -g '!{.git}/*' 2> /dev/null"
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fi

if (( $+commands[convert] )); then
  img2pdf () {
    for f in *.(png|jpg|eps); do
      convert $f ${f%.*}.pdf
    done
  }
fi

if (( $+commands[kubectl] )); then
  # Delay loading massive kubectl completion script until first TAB on kubectl.
  __dotfiles_kubectl_completion_loader() {
    unfunction __dotfiles_kubectl_completion_loader
    source "${ZSH_HOME}kubectl.zsh"
    __start_kubectl "$@"
  }
  compdef __dotfiles_kubectl_completion_loader kubectl
fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
