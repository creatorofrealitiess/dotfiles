#!/usr/bin/env bash
# Dotfiles install script for GitHub Codespaces.
# Restores Claude Code login from the CLAUDE_CREDENTIALS Codespaces secret.
set -e

# 1. Install the Claude Code CLI if it isn't already present.
if ! command -v claude >/dev/null 2>&1; then
  echo "Installing Claude Code CLI..."
  npm install -g @anthropic-ai/claude-code
fi

# 2. Restore credentials from the CLAUDE_CREDENTIALS secret, if set.
if [ -n "$CLAUDE_CREDENTIALS" ]; then
  echo "Restoring Claude credentials..."
  mkdir -p ~/.claude
  printf '%s' "$CLAUDE_CREDENTIALS" > ~/.claude/.credentials.json
  chmod 600 ~/.claude/.credentials.json
  echo "Claude credentials restored."
else
  echo "CLAUDE_CREDENTIALS not set; skipping credential restore."
fi
