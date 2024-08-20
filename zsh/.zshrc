# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="gnzh"
export EDITOR="nvim"

# Adding things to the PATH
#PATH="$PATH:something"
#export PATH

# Oh my zsh plugins
plugins=(git colored-man-pages thefuck zsh-completions)

# Sourcing Oh my zsh
source $ZSH/oh-my-zsh.sh

# Syntax highlighting plugin
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# Yazi shell wrapper
function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# Aliases
alias fzf='fzf --preview="bat --color=always {}"'
alias vff='nvim $(fzf --preview="bat --color=always {}")'
alias vi='nvim'
alias kys="sudo shutdown"

# Start tmux automatically
#if [[ $SHLVL < "2" ]]
#then
#	tmux
#fi

# Set up zoxide
eval "$(zoxide init --cmd cd zsh)"

