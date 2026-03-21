# use emacs keybindings in terminal
set -o emacs

# enable editing cmdline with vim
autoload -U edit-command-line && zle -N edit-command-line
bindkey '^x^e' edit-command-line

# Keybindings
bindkey '^n' history-search-backward
bindkey '^p' history-search-forward
bindkey '^F' autosuggest-accept

# History
HISTSIZE=5000
HISTFILE="$HOME/.zsh_history"
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups

export EDITOR=nvim
