#!/bin/bash

# Zsh Setup Script
# This script sets zsh as the default shell

echo "Setting up zsh as default shell..."

# Check if zsh is installed
ZSH_PATH=$(which zsh 2>/dev/null)
if [ -z "$ZSH_PATH" ] || [ ! -x "$ZSH_PATH" ]; then
    echo "✗ zsh is not installed or not executable"
    echo "Please install zsh first:"
    echo "  Ubuntu/Debian: sudo apt install zsh"
    echo "  macOS: brew install zsh"
    echo "  CentOS/RHEL: sudo yum install zsh"
    exit 1
fi

echo "✓ zsh is installed at: $ZSH_PATH"

# Get current shell
CURRENT_SHELL=$(echo $SHELL)

if [ "$CURRENT_SHELL" = "$ZSH_PATH" ]; then
    echo "✓ zsh is already the default shell"
else
    echo "Current shell: $CURRENT_SHELL"
    echo "Changing default shell to zsh..."
    
    # Check if zsh is in /etc/shells
    if ! grep -q "$ZSH_PATH" /etc/shells; then
        echo "Adding zsh to /etc/shells..."
        echo "$ZSH_PATH" | sudo tee -a /etc/shells
    fi
    
    # Change default shell
    if chsh -s "$ZSH_PATH"; then
        echo "✓ Default shell changed to zsh"
        echo "Please restart your terminal or run 'exec zsh' to use zsh"
    else
        echo "✗ Failed to change default shell"
        echo "You may need to run: sudo chsh -s $ZSH_PATH $USER"
        exit 1
    fi
fi

echo "Zsh setup completed!"
echo ""
echo "Note: You may need to restart your terminal for changes to take effect."