## Setup steps

1. install `homebrew` and `zsh via native package manager if not present
2. `run xargs brew install < plugins.txt
3. run `chsh -s $(which zsh)` and log out

### The following things need to be manually installed via system provided package manager:
* zed
* zen
* ghostty
* JetBrains Mono Nerd Font
* SF Compact Display Font

per-device stuff or sensitive data should be in ` ~/.localrc` and will be automatically sourced
