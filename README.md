dotfiles
===
**Zsh + Neovim/Vim + Tmux**

- Zsh
  - [zplug](https://github.com/zplug/zplug)
  - [fzf](https://github.com/junegunn/fzf)
- Neovim/Vim
  - [vim-plug](https://github.com/junegunn/vim-plug)
  - [builtin LSP](https://neovim.io/doc/user/lsp.html)
    - [nvim-lspconfig]
    - [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
    - [mason.nvim](https://github.com/williamboman/mason.nvim)
    - [null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim)
  - [noice.nvim](https://github.com/folke/noice.nvim)
  - [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
  - [lualine.nvim(https://github.com/nvim-lualine/lualine.nvim)]
- Tmux
  - [tpm](https://github.com/tmux-plugins/tpm)
- Git
  - aliases
  - [delta](https://github.com/dandavison/delta)
  - [nbdime](https://github.com/jupyter/nbdime)
- Homebrew (macOS only)
  - [homebrew-bundle](https://github.com/Homebrew/homebrew-bundle)
  - Rosetta2 (macOS with Apple silicon only)
- [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts)
- htop

## Installation
```
$ bash -c "`curl -fsSL raw.github.com/vwrs/dotfiles/master/bootstrap`"

       _   _        __ ___      ___
     /' \/' \      / /'___\ __ /\_ \
    /\_/\__//     / /\ \__//\_\\//\ \      __    ____
    \//\/__/     / /\ \ ,__\/\ \ \ \ \   /'__`\ /',__\
                / /__\ \ \_/\ \ \ \_\ \_/\  __//\__, `\
               /_//\_\\ \_\  \ \_\/\____\ \____\/\____/
              /_/ \/_/ \/_/   \/_/\/____/\/____/\/___/


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

