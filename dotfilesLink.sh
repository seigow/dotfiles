#! /bin/sh
ln -s $(pwd)/git/gitconfig ~/.gitconfig
ln -s $(pwd)/git/gitignore_global ~/.gitignore_global
ln -s $(pwd)/vimrc ~/.vimrc
ln -s $(pwd)/zshrc ~/.zshrc

# Setup zsh as default shell
echo "Setting up zsh as default shell..."
sh $(pwd)/scripts/zsh-setup.sh

# Setup Claude Code global configuration
echo "Setting up Claude Code configuration..."
sh $(pwd)/scripts/claude-setup.sh
