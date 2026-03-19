# plugin bootstrap (fast path)
# ===

# zplug commands are too slow
# source ~/.zplug/init.zsh
# zplug "zsh-users/zsh-syntax-highlighting", defer:2
# zplug "zsh-users/zsh-completions"
# zplug "docker/cli", use:contrib/completion/zsh
# zplug "github/hub", use: etc/hub.zsh_completion
# ZPLUG_HOME=${ZPLUG_HOME:-$HOME/.zplug}
# ZPLUG_REPOS=${ZPLUG_REPOS:-$ZPLUG_HOME/repos}
# Optional: install missing zplug plugins only when explicitly enabled.
# This avoids expensive startup checks on every shell launch.
# if [[ "${ZSH_ZPLUG_AUTO_INSTALL:-0}" == "1" ]] && ! zplug check >/dev/null 2>&1; then
#   printf "Install(zplug)? [y/N]: "
#   if read -q; then
#     echo
#     zplug install
#   fi
# fi

# Add completion definitions directly instead of invoking zplug runtime.
if [[ -d "$ZPLUG_REPOS/zsh-users/zsh-completions/src" ]]; then
  FPATH="$ZPLUG_REPOS/zsh-users/zsh-completions/src:$FPATH"
fi
if [[ -d "$ZPLUG_REPOS/docker/cli/contrib/completion/zsh" ]]; then
  FPATH="$ZPLUG_REPOS/docker/cli/contrib/completion/zsh:$FPATH"
fi
if [[ -f "$ZPLUG_REPOS/github/hub/etc/hub.zsh_completion" ]]; then
  source "$ZPLUG_REPOS/github/hub/etc/hub.zsh_completion"
fi

# themes
# --------------
# zplug "caiogondim/bullet-train-oh-my-zsh-theme", as:theme
# random theme
# themes=("frmendes/geometry" "denysdovhan/spaceship-prompt" "caiogondim/bullet-train-oh-my-zsh-theme")
# N=${#themes[@]}
# ((N=(RANDOM%N)+1))
# RANDOM_THEME=${themes[$N]}
# zplug $RANDOM_THEME, as:theme

# spaceship
SPACESHIP_DIR_TRUNC_REPO=false  # do not truncate path in repos

SPACESHIP_PROMPT_ORDER=(
  time           # Time stamps section
  user           # Username section
  host           # Hostname section
  dir            # Current directory section
  git            # Git section (git_branch + git_status)
  hg             # Mercurial section (hg_branch  + hg_status)
  package        # Package version
  node           # Node.js section
  ruby           # Ruby section
  python         # Python section
  xcode          # Xcode section
  swift          # Swift section
  golang         # Go section
  perl           # Perl section
  php            # PHP section
  rust           # Rust section
  java           # Java section
  lua            # Lua section
  julia          # Julia section
  docker         # Docker section
  docker_compose # Docker section
  venv           # virtualenv section
  conda          # conda virtualenv section
  kubectl        # Kubectl context section
  ansible        # Ansible section
  terraform      # Terraform workspace section
  exec_time      # Execution time
  line_sep       # Line break
  jobs           # Background jobs indicator
  exit_code      # Exit code section
  sudo           # Sudo indicator
  char           # Prompt character
)
# \uf943 \u2502
SPACESHIP_PROMPT_DEFAULT_PREFIX="\u2591 "
SPACESHIP_DIR_PREFIX=$SPACESHIP_PROMPT_DEFAULT_PREFIX
SPACESHIP_GIT_PREFIX=$SPACESHIP_PROMPT_DEFAULT_PREFIX
SPACESHIP_PYTHON_PREFIX=$SPACESHIP_PROMPT_DEFAULT_PREFIX
SPACESHIP_DOCKER_PREFIX=$SPACESHIP_PROMPT_DEFAULT_PREFIX

SPACESHIP_USER_COLOR="blue"
SPACESHIP_USER_SUFFIX=""

SPACESHIP_HOST_COLOR="blue"
SPACESHIP_HOST_COLOR_SSH="blue"
SPACESHIP_HOST_PREFIX="%F{blue}@%f"

SPACESHIP_DIR_COLOR="cyan"

SPACESHIP_GIT_BRANCH_COLOR="green"
SPACESHIP_GIT_STATUS_COLOR="yellow"
SPACESHIP_GIT_STATUS_PREFIX=" <"
SPACESHIP_GIT_STATUS_SUFFIX=">"
SPACESHIP_GIT_STATUS_MODIFIED="!"

SPACESHIP_DOCKER_SYMBOL="\uf308 "
SPACESHIP_PYTHON_SYMBOL="\uf81f "

SPACESHIP_CHAR_SYMBOL="\uf460"
SPACESHIP_CHAR_SUFFIX=" "

# bullet-train
BULLETTRAIN_PROMPT_ORDER=(status custom context dir git cmd_exec_time)
BULLETTRAIN_PROMPT_CHAR="%F{red}>%F{green}>%F{white}>%f"
BULLETTRAIN_TIME_BG=white
BULLETTRAIN_CONTEXT_DEFAULT_USER=hideaki
if [ "$(hostname)" != "Hideaki" ]; then
  BULLETTRAIN_IS_SSH_CLIENT=true
fi
BULLETTRAIN_GIT_COLORIZE_DIRTY=true
BULLETTRAIN_GIT_BG=green
BULLETTRAIN_GIT_COLORIZE_DIRTY_BG_COLOR=yellow

# Theme and highlighting are sourced directly for lower startup latency.
if [[ -f "$ZPLUG_REPOS/denysdovhan/spaceship-prompt/spaceship.zsh" ]]; then
  source "$ZPLUG_REPOS/denysdovhan/spaceship-prompt/spaceship.zsh"
fi

if [[ -f "$ZPLUG_REPOS/zsh-users/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]; then
  source "$ZPLUG_REPOS/zsh-users/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

