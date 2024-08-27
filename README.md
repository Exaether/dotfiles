# Intro

*This is a personal installation guide*, feel free to not follow it and do whatever you want with theses conf files.
This repo is made to be easily understandable and very modular, so anyone can copy part of it without being bothered by the rest.


# Dependencies

## for i3 environment:

i3, ly, i3lock-colors, picom, polybar, rofi, dunst, feh, maim, fontconfig, pulseaudio, xautolock, xclip, xdg-utils

And maybe others things I've forgotten
/!\ at least for now, i3lock-colors is fucked up, you'll need to add things to the PKGBUILD before building it (refer to the AUR page, comment section)

## for cli:

kitty, zsh + oh-my-zsh, tmux, neovim, fzf, yazi, bat, zoxide

### For neovim (mainly for lsp to install)

luarocks, rust, cargo-asm, nodejs, npm, treesitter-cli, dotnet-runtime

## Fonts that are not in .local/share/fonts:

Noto Fonts, Noto Color Emoji, Symbols Nerd Fonts **Mono**, source Han sans CN


# Installation

## Install script
TODO

## Manual
Install dependencies, and then just `ln -s` everything at the right place. I'm not using stow to avoid the shitty folder structure in this repo

Almost everything goes to `~/.config/`.
### Exceptions
- tmux: link only the config file, not the entire folder (you'll need to run '\<leader>I' to install the plugins)
- zsh folder
	- .zshrc goes in `~/` (am i really writhing this?)
- `fonts` goes in `.local/share`
- `scripts` goes in `.local/`
- `wallpapers` folder goes in home
- that's about it.


## additional config

### Set up git
Obviously, install git...
And set up user name and email

add something like this to the `~/.gitconfig`
```
[includeIf "gitdir:~/work/"]
    path = ~/work/.gitconfig
```
and create a folder for work repos with another .gitconfig inside:
```
[user]
	name = real name
    email = work email
```

Also setup GCM:
https://github.com/git-ecosystem/git-credential-manager/blob/release/docs/install.md
use the source install script, cause else, the .NET tool version will fuck you up cause it want an older version
this require to install dotnet-sdk

### tmux and zsh plugins
*Note that will prob be automated in the install script*

Install tpm for tmux:
`git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
and then reload (`leader + r`) and install plugins (`leader + I`)

Also check zsh plugins for anything to install/setup (like for thefuck and zsh-completions)

### Spotify polybar module

I'm using this one:
https://github.com/mihirlad55/polybar-spotify-module
it only work with spotify, and need to refresh it when restarting polybar (just need to pause then play)

Another is pre-configured tho.
It use playerctl, so it work with any player, and it have a scrolling status, but it's **MUCH** slower, since it use a script.
If your CPU can handle it, it's prob better, but for me, it crashed polybar when using it in the first 2 minutes after startup.
To set it up, use the `title` module instead of `spotify` and you may need to uncomment things from the control modules.

