# Add Homebrew packages to PATH

PLATFORM=$(uname)

if [[ $PLATFORM == "Darwin" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [[ $PLATFORM =~ ^Linux ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# Initialize fzf
eval "$(fzf --zsh)"

# get fzf-tab
if [[ ! -d "$HOME/.zsh/fzf-tab" ]]; then
  mkdir -p "$HOME/.zsh/fzf-tab"
  git clone https://github.com/Aloxaf/fzf-tab $HOME/.zsh/fzf-tab
fi

# load fzf-tab
source "$HOME/.zsh/fzf-tab/fzf-tab.plugin.zsh"

# Load auto-completions
if [[ $PLATFORM == "Darwin" ]]; then
  if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit
  fi
elif [[ $PLATFORM =~ ^Linux ]]; then
  FPATH="/home/linuxbrew/.linuxbrew/share/zsh-completions:$FPATH"

  autoload -Uz compinit
  compinit
fi

set -o emacs

# enable editing command with vim
autoload -U edit-command-line && zle -N edit-command-line
bindkey '^x^e' edit-command-line

if [[ $PLATFORM == "Darwin" ]]; then
  # load zsh plugins
  source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
elif [[ $PLATFORM =~ ^Linux ]]; then
  source /home/linuxbrew/.linuxbrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  source /home/linuxbrew/.linuxbrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# clipboard aliases for linux (ubuntu)
if [[ $PLATFORM =~ ^Linux ]]; then
  alias pbcopy='xclip -selection clipboard'
  alias pbpaste='xclip -selection clipboard -o'
fi

# load git snippets
source "$HOME/.zsh/git-snippets/git-snippets.plugin.zsh"

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

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# load local stuff
if [ -f "$HOME/.localrc" ]; then
  source "$HOME/.localrc"
fi

alias clear='clear -x'
alias ls='ls -al --color'
alias reload="source $HOME/.zshrc"

# initialize zoxide
eval "$(zoxide init zsh)"

alias cd="z"

alias y="yazi"

eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.toml)"

export EDITOR=nvim
