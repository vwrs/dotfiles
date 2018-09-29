SPACESHIP_PROMPT_ORDER=(
  time          # Time stampts section
  user          # Username section
  host          # Hostname section
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  pyenv         # Pyenv section
  docker        # Docker section
  exec_time     # Execution time
  line_sep      # Line break
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
alias ls="ls -tAF --color=auto"
alias du="du -bch --time"
alias dusort="du --max-depth=1 -bch | sort -hr"

