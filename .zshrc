<<<<<<< HEAD
source "$HOME/.zsh/p10k.zsh"
source "$HOME/.zsh/fzf.zsh"
=======
# run zellij on shell start
if [[ -z "$ZELLIJ" ]]; then
    if [[ $TERM =~ "xterm-ghostty" ]]; then
      zellij attach -c $USER@$HOST
    fi

    if [[ "$ZELLIJ_AUTO_EXIT" == "true" ]]; then
        exit
    fi
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

PLATFORM=$(uname)

# Initialize fzf
eval "$(fzf --zsh)"

# get fzf-tab
if [[ ! -d "$HOME/.zsh/fzf-tab" ]]; then
  mkdir -p "$HOME/.zsh/fzf-tab"
  git clone https://github.com/Aloxaf/fzf-tab $HOME/.zsh/fzf-tab
fi

# load fzf-tab
>>>>>>> 6c51360 (load zellij first)
source "$HOME/.zsh/fzf-tab/fzf-tab.plugin.zsh"
source "$HOME/.zsh/auto-completions.zsh"
source "$HOME/.zsh/auto-suggestions.zsh"
source "$HOME/.zsh/syntax-highlighting.zsh"
source "$HOME/.zsh/zoxide.zsh"
source "$HOME/.zsh/misc.zsh"
source "$HOME/.zsh/git-snippets.zsh"
source "$HOME/.zsh/aliases.zsh"

# load non-versioned local stuff
if [ -f "$HOME/.localrc" ]; then
  source "$HOME/.localrc"
fi

# launch zellij
source "$HOME/.zsh/zellij-init.zsh"
