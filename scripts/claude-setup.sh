#!/bin/bash

# Claude Code Setup Script
# This script sets up Claude Code global configuration

echo "Setting up Claude Code global configuration..."

# Create Claude config directory
mkdir -p ~/.claude

# Link global CLAUDE.md file
if [ -f "$(pwd)/claude/claude-global.md" ]; then
    echo "Linking global CLAUDE.md..."
    ln -sf "$(pwd)/claude/claude-global.md" ~/.claude/CLAUDE.md
    echo "✓ Global CLAUDE.md linked successfully"
else
    echo "✗ claude-global.md not found in current directory"
    exit 1
fi

# Link Claude settings file
if [ -f "$(pwd)/claude/settings.json" ]; then
    echo "Linking Claude settings.json..."
    ln -sf "$(pwd)/claude/settings.json" ~/.claude/settings.json
    echo "✓ Claude settings.json linked successfully"
else
    echo "! claude/settings.json not found - skipping settings link"
fi

# Check if Claude Code is installed
if command -v claude &> /dev/null; then
    echo "✓ Claude Code is installed"
    claude --version
else
    echo "! Claude Code is not installed"
    echo "Please install Claude Code from: https://claude.ai/code"
fi

echo "Claude Code setup completed!"
echo ""
echo "Global CLAUDE.md is now available at: ~/.claude/CLAUDE.md"
echo "Claude settings.json is now available at: ~/.claude/settings.json"
echo "This configuration will be used across all projects."