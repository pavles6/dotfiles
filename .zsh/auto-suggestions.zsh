PLATFORM=$(uname)

# load zsh autosuggestions
if [[ $PLATFORM == "Darwin" ]]; then
    ZSH_PLUGIN_PATH=$(brew --prefix)/share
elif [[ $PLATFORM =~ ^Linux ]]; then
    ZSH_PLUGIN_PATH="/usr/share/zsh/plugins"
fi
source $ZSH_PLUGIN_PATH/zsh-autosuggestions/zsh-autosuggestions.zsh
