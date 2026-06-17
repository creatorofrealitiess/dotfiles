#!/bin/bash
if command -v claude >/dev/null 2>&1; then
  echo "Claude Code already installed ($(command -v claude)); skipping."
else
  echo "Installing Claude Code..."
  curl -fsSL https://claude.ai/install.sh | bash
fi
