SPACESHIP_PROMPT_ORDER=(
  time          # Time stampts section
  user          # Username section
  host          # Hostname section
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  exec_time     # Execution time
  line_sep      # Line break
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
alias ls="ls -tGAF"
alias l.="ls -d .*"
alias du="du -ch"
alias dusort"du -d 1 -ch | sort -hr"
alias sockson="networksetup -setsocksfirewallproxystate Ethernet on"
alias socksoff="networksetup -setsocksfirewallproxystate Ethernet off"

# homebrew
if [ "$(uname -m)" = "arm64" ]; then
  export HOMEBREW_PREFIX=/opt/homebrew
else
  export HOMEBREW_PREFIX=/usr/local
fi
eval "$(${HOMEBREW_PREFIX}/bin/brew shellenv)"
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export HOMEBREW_BREWFILE=~/dotfiles/Brewfile
# completion
# https://docs.brew.sh/Shell-Completion
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi
# brew-file
if [ -f $(brew --prefix)/etc/brew-wrap ];then
  source $(brew --prefix)/etc/brew-wrap
fi

# source-highlight
# https://www.gnu.org/software/src-highlite/source-highlight.html#Using-source_002dhighlight-with-less
if [ -x "`which source-highlight`" ]; then
  export LESSOPEN="| $HOMEBREW_PREFIX/bin/src-hilite-lesspipe.sh %s"
fi

# tig(--with-docs, docbooks, asciidoc)
export XML_CATALOG_FILES=$HOMEBREW_PREFIX/etc/xml/catalog

# iTerm2
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# avoid git errors (pyenv)
export PATH="$HOMEBREW_PREFIX/opt/gettext/bin:$PATH"
