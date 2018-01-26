# compile if .zwc is old
if [ ~/.zshrc -nt ~/.zshrc.zwc ]; then
   echo "zcompile .zshrc"
   zcompile ~/.zshrc
fi
if [ ~/.zshenv -nt ~/.zshenv.zwc ]; then
   echo "zcompile .zshenv"
   zcompile ~/.zshenv
fi
for f in ${ZSH_HOME}*.zsh; do
  if [ $f -nt $f.zwc ]; then
    echo "zcompile $f"
    zcompile $f
done

ZSH_HOME=~/.zsh/
source ${ZSH_HOME}zplug.zsh
source ${ZSH_HOME}basic.zsh
source ${ZSH_HOME}commands.zsh
source ${ZSH_HOME}aliases.zsh
source ${ZSH_HOME}python.zsh

# OS dependent
if [ "$(uname)" = "Darwin" ]; then
  source ${ZSH_HOME}darwin.zsh
else # Linux
  source ${ZSH_HOME}linux.zsh
  source ${ZSH_HOME}cuda.zsh
fi

