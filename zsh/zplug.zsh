# zplug
# ===
source ~/.zplug/init.zsh
# compile if .zwc is old
if [ ~/.zshrc -nt ~/.zshrc.zwc ]; then
   echo "zcompile .zshrc"
   zcompile ~/.zshrc
fi
if [ ~/.zshenv -nt ~/.zshenv.zwc ]; then
   echo "zcompile .zshenv"
   zcompile ~/.zshenv
fi

zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-completions"
zplug "erikw/tmux-powerline"
# zplug "zplug/zplug", hook-build:"zplug --self-manage"
# zplug "lib/clipboard", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"

# themes
# --------------
# zplug "frmendes/geometry", as:theme
zplug denysdovhan/spaceship-prompt, use:spaceship.zsh, from:github, as:theme
# zplug "caiogondim/bullet-train-oh-my-zsh-theme", as:theme

# random theme
# themes=("frmendes/geometry" "denysdovhan/spaceship-prompt" "caiogondim/bullet-train-oh-my-zsh-theme")
# N=${#themes[@]}
# ((N=(RANDOM%N)+1))
# RANDOM_THEME=${themes[$N]}
# zplug $RANDOM_THEME, as:theme

# spaceship
if [ "$(hostname)" != "Hideaki" ]; then
  SPACESHIP_USER_SHOW="always"
  SPACESHIP_HOST_SHOW="always"
fi
SPACESHIP_USER_COLOR="black"
SPACESHIP_USER_SUFFIX=""
SPACESHIP_HOST_COLOR="black"
SPACESHIP_HOST_COLOR_SSH="blue"
SPACESHIP_HOST_PREFIX="@"
SPACESHIP_DIR_PREFIX=":: "
SPACESHIP_DIR_COLOR="cyan"
SPACESHIP_GIT_PREFIX=":: "
SPACESHIP_PYENV_PREFIX=":: "
SPACESHIP_DOCKER_PREFIX=":: "
SPACESHIP_CHAR_SUFFIX=" "
SPACESHIP_CHAR_COLOR_SUCCESS="white"
SPACESHIP_GIT_BRANCH_COLOR="green"

# bullet-train
BULLETTRAIN_PROMPT_ORDER=(time status custom context dir git hg cmd_exec_time)
BULLETTRAIN_PROMPT_CHAR="%F{red}>%F{green}>%F{white}>%f"
BULLETTRAIN_TIME_BG=white
BULLETTRAIN_CONTEXT_DEFAULT_USER=hideaki
if [ "$(hostname)" != "Hideaki" ]; then
  BULLETTRAIN_IS_SSH_CLIENT=true
fi
BULLETTRAIN_GIT_COLORIZE_DIRTY=true
BULLETTRAIN_GIT_BG=green
BULLETTRAIN_GIT_COLORIZE_DIRTY_BG_COLOR=yellow

# Install plugins if there are plugins that have not been installed
# if ! zplug check --verbose; then
#   printf "Install(zplug)? [y/N]: "
#     if read -q; then
#         echo; zplug install
#     fi
# fi

zplug load

