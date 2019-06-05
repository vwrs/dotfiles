dotfiles
===
**zsh + Neovim/Vim + tmux**

- zsh
  - [zplug](https://github.com/zplug/zplug)
- Neovim/Vim
  - [vim-plug](https://github.com/junegunn/vim-plug)
- tmux
  - [tpm](https://github.com/tmux-plugins/tpm)
- Homebrew (macOS)
  - [homebrew-bundle](https://github.com/Homebrew/homebrew-bundle)
- git
- htop
- [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts)

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
```

## Screenshot
![screen-capture1](https://github.com/vwrs/dotfiles/blob/imgs/imgs/screen-capture1.png)

