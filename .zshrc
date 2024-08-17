# Add Homebrew packages to PATH
eval "$(/opt/homebrew/bin/brew shellenv)"

# Initialize fzf
eval "$(fzf --zsh)"

# get fzf-tab
if [[ ! -d "$HOME/.zsh/fzf-tab" ]]; then
    mkdir -p "~/.zsh/fzf-tab"
    git clone https://github.com/Aloxaf/fzf-tab ~/.zsh/fzf-tab
fi

# load fzf-tab
source ~/.zsh/fzf-tab/fzf-tab.plugin.zsh

# Load auto-completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

# load zsh plugins
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# load git snippets
source "$HOME/.zsh/git-snippets/git-snippets.plugin.zsh"

# Keybindings
bindkey '^n' history-search-backward
bindkey '^p' history-search-forward
bindkey '^F' autosuggest-accept

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# load local stuff
if [ -f ~/.localrc ]; then
  source ~/.localrc
fi

alias clear='clear -x'
alias ls='ls --color'
alias reload="exec zsh"

# initialize zoxide
eval "$(zoxide init zsh)"

alias cd="z"

# initialize starship
eval "$(starship init zsh)"
