PLATFORM=$(uname)

# load zsh syntax highlighting
if [[ $PLATFORM == "Darwin" ]]; then
    ZSH_PLUGIN_PATH=$(brew --prefix)/share
elif [[ $PLATFORM =~ ^Linux ]]; then
    ZSH_PLUGIN_PATH="/usr/share/zsh/plugins"
fi
source $ZSH_PLUGIN_PATH/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
