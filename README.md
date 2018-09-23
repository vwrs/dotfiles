dotfiles
===
**zsh + tmux + Neovim [Vim]**

- zsh
- tmux
- Neovim / Vim
- htop
- zplug
- vim-plug
- Powerline patched fonts

## Preliminary
### requirements
Install `zsh`, `git`, `neovim` or `vim`, and `tmux`.

### recommended tools
- [fzf](https://github.com/junegunn/fzf) (automatically installed via vim-plug)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [reattach-to-user-namespace](https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard) (for macOS)

## Installation
```
$ bash -c "`curl -fsSL raw.github.com/vwrs/dotfiles/master/bootstrap`"
                   __          __       ___      ___
                  /\ \        /\ \__  /'___\ __ /\_ \
                  \_\ \    ___\ \ ,_\/\ \__//\_\\//\ \      __    ____
 _______          /'_` \  / __`\ \ \/\ \ ,__\/\ \ \ \ \   /'__`\ /',__\      _______
/\______\      __/\ \L\ \/\ \L\ \ \ \_\ \ \_/\ \ \ \_\ \_/\  __//\__, `\    /\______\
\/______/     /\_\ \___,_\ \____/\ \__\\ \_\  \ \_\/\____\ \____\/\____/    \/______/
              \/_/\/__,_ /\/___/  \/__/ \/_/   \/_/\/____/\/____/\/___/


Commands:
  init (download dotfiles, vim-plug, zplug, tpm)
  font (install powerline patched fonts)
  deploy (symlink (force override) dotfiles)
  deploy_root (symlink dotfiles in super user)
  quit

command: init
...
command: font
...
command: deploy
...
$ sudo vi /etc/shells
add "/path/to/zsh"
$ chsh
use "/path/to/zsh"

$ zplug install
$ nvim [vim]
Run `:PlugInstall`.
$ tmux
Run `Prefix+I`.
```

## Screenshot
![screen-capture1](https://github.com/vwrs/dotfiles/blob/imgs/imgs/screen-capture1.png)

