alias clear='clear -x'
alias ls='ls -al --color'
alias reload="source $HOME/.zshrc"

if [[ "$ZOXIDE_DISABLE" != "1" ]]; then
  alias cd='z'
fi
