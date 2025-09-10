source "$HOME/.zsh/p10k.zsh"
source "$HOME/.zsh/fzf.zsh"
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
