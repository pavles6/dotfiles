if [ ! -d $HOME/.antidote ]; then
    git clone --depth=1 https://github.com/mattmc3/antidote.git ${ZDOTDIR:-~}/.antidote
fi

# Load auto-completions
autoload -U compinit && compinit

source ~/.antidote/antidote.zsh

antidote load

source ~/.p10k.zsh

# Keybindings
bindkey '^j' history-search-backward
bindkey '^k' history-search-forward
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

# Add Homebrew packages to PATH
eval "$(/opt/homebrew/bin/brew shellenv)"

# Initialize fzf
eval "$(fzf --zsh)"

alias ls='ls --color'

# Source ~/.zshrc
alias reload="exec zsh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Local stuff

if [ -f ~/.localrc ]; then
  source ~/.localrc
fi

preexec() { print -Pn "\e]0;$1%~\a" }

alias clear='clear -x'
alias vim='nvim'

export DENO_INSTALL="/Users/pavle/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
export PATH="/Users/pavle/.bin:$PATH"

echo $(whoami)
