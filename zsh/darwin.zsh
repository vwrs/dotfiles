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
alias htop="sudo htop"
alias sockson="networksetup -setsocksfirewallproxystate Ethernet on"
alias socksoff="networksetup -setsocksfirewallproxystate Ethernet off"

# upgrade homebrew-cask
brew-cask-upgrade () {
  for app in $(brew cask list); do
    local latest="$(brew cask info "${app}" | awk 'NR==1{print $2}')";
    local versions=($(ls -1 "/usr/local/Caskroom/${app}/.metadata/"));
    local current=$(echo ${versions} | awk '{print $NF}');
    if [[ "${latest}" = "latest" ]]; then
      echo "[!] ${app}: ${current} == ${latest}";
      [[ "$1" = "-f" ]] && brew cask install "${app}" --force;
      continue;
    elif [[ "${current}" = "${latest}" ]]; then
      continue;
    fi;
    echo "[+] ${app}: ${current} -> ${latest}";
    brew cask uninstall "${app}" --force;
    brew cask install "${app}";
  done;
}

# homebrew-cask
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
# homebrew
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
# brew-file
export HOMEBREW_BREWFILE=~/dotfiles/.brewfile
# git
export PATH="/usr/local/share/git-core/contrib/diff-highlight:$PATH"
# tig(--with-docs, docbooks, asciidoc)
export XML_CATALOG_FILES=/usr/local/etc/xml/catalog

if [ "$(hostname)" = "Hideaki" ]; then  # my own pc
  export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"
else

fi

# brew-file
if [ -f $(brew --prefix)/etc/brew-wrap ];then
  source $(brew --prefix)/etc/brew-wrap
fi

# iTerm2
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

