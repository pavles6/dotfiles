#!/bin/zsh

PACKAGE_FILE=".zsh_plugins.txt"

while IFS= read -r package; do
    # Check if the package is already installed
    if brew list --formula | grep -q "^$package\$"; then
        echo "$package is already installed."
    else
        echo "Installing $package..."
        brew install "$package"
    fi
done < "$PACKAGE_FILE"
