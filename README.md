dotfiles
===
**zsh + Neovim/Vim + tmux**

- zsh
  - [zplug](https://github.com/zplug/zplug)
- Neovim/Vim
  - [vim-plug](https://github.com/junegunn/vim-plug)
- tmux
  - [tpm](https://github.com/tmux-plugins/tpm)
- git
  - aliases
  - [delta](https://github.com/dandavison/delta)
  - [nbdime](https://github.com/jupyter/nbdime)
- htop
- [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts)
- Homebrew (macOS only)
  - [homebrew-bundle](https://github.com/Homebrew/homebrew-bundle)
- Rosetta2 (macOS with Apple silicon only)

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
  init (download dotfiles, Homebrew (macOS), vim-plug, zplug and tpm)
  font-nerd (install SauceCodePro Nerd Font)
  font-powerline (install powerline patched fonts)
  deploy (symlink (force override) dotfiles)
  deploy_root (symlink dotfiles in super user)
  quit

command: init
...
command: font-nerd
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
$ git config --global user.name "{{user.name}}"
$ git config --global user.email "{{user.email}}"
```

## Screenshot
![screen-capture1](https://github.com/vwrs/dotfiles/blob/imgs/imgs/screen-capture1.png)

