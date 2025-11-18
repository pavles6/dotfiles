# Initialize fzf
eval "$(fzf --zsh)"

# Install fzf-tab
if [[ ! -d "$HOME/.zsh/fzf-tab" ]]; then
  git clone https://github.com/Aloxaf/fzf-tab $HOME/.zsh/fzf-tab 
fi
