# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Add Homebrew packages to PATH

PLATFORM=$(uname)

# load homebrew binaries on mac
if [[ $PLATFORM == "Darwin" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
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
    fi
elif [[ $PLATFORM =~ ^Linux ]]; then
    FPATH="/usr/share/zsh/site-functions/:$FPATH"
fi
autoload -Uz compinit
compinit

# use emacs keybindings in terminal
set -o emacs

# enable editing cmdline with vim
autoload -U edit-command-line && zle -N edit-command-line
bindkey '^x^e' edit-command-line

# load zsh autosuggestions and syntax highlighting
if [[ $PLATFORM == "Darwin" ]]; then
    ZSH_PLUGIN_PATH=$(brew --prefix)/share
elif [[ $PLATFORM =~ ^Linux ]]; then
    ZSH_PLUGIN_PATH="/usr/share/zsh/plugins"
fi
source $ZSH_PLUGIN_PATH/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH_PLUGIN_PATH/zsh-autosuggestions/zsh-autosuggestions.zsh

# load git command snippets
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

# load machine specific stuff
if [ -f "$HOME/.localrc" ]; then
  source "$HOME/.localrc"
fi

# initialize zoxide
eval "$(zoxide init zsh)"

# custom aliases
alias clear='clear -x'
alias ls='ls -al --color'
alias reload="source $HOME/.zshrc"
alias cd="z"
alias y="yazi"

export EDITOR=nvim

# load powerlevel10k
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# run zellij on shell start
if [[ -z "$ZELLIJ" ]]; then
    if [[ $TERM =~ "xterm-ghostty" ]]; then
      zellij attach -c $USER@$HOST
    fi

    if [[ "$ZELLIJ_AUTO_EXIT" == "true" ]]; then
        exit
    fi
fi
