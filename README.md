
# Dependencies

## for i3 environement:

i3, i3lock-colors, picom, polybar, rofi, dunst, feh, maim, fontconfig, pulseaudio,

and maybe others things i've forgotten

also need this:
https://github.com/mihirlad55/polybar-spotify-module

## for cli:

kitty, zsh + oh-my-zsh, tmux, neovim, fzf, yazi, bat, zoxide

## Fonts that are not in .local/share/fonts:

Noto Fonts, Noto Color Emoji, Symbols Nerd Fonts, source Han sans CN


# Installation

## Install script
TODO

## Manual
Install dependencies, and then just `ln -s` everything at the right place.

Almost everything goes to `~/.config/`.
### exeptions
- tmux: link only the config file, not the entire folder
- zsh folder
	- .zshrc goes in `~/` (am i really writhing this?)
- local folder
	- `scripts/` goes directly in `~/.local/`
	- things in `share/` goes in `~/.local/share` (do not link the entire `share` folder, only what's inside)
- `wallpapers` folder goes in home
- that's about it.


## additionnal config

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

also setup GCM:
https://github.com/git-ecosystem/git-credential-manager/blob/release/docs/install.md
use the source install script, cause else, the .NET tool version will fuck you up cause it want an older version

### tmux and zsh plugins
*Note that will prob be automated in the install script*

Intall tpm for tmux:
`git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
and then reload (`leader + r`) and install plugins (`leader + I`)

Also check zsh plugins for anything to install/setup (like for thefuck and zsh-completions)
