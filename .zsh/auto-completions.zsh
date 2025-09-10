PLATFORM=$(uname)

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

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
