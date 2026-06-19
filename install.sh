#!/usr/bin/env bash
# Dotfiles install script for GitHub Codespaces.
# Restores Claude Code login (tokens + account identity) from Codespaces secrets.
set -e

# 1. Install the Claude Code CLI if it isn't already present.
if ! command -v claude >/dev/null 2>&1; then
  echo "Installing Claude Code CLI..."
  npm install -g @anthropic-ai/claude-code
fi

# 2. Restore OAuth tokens from the CLAUDE_CREDENTIALS secret.
if [ -n "$CLAUDE_CREDENTIALS" ]; then
  echo "Restoring Claude credentials..."
  mkdir -p ~/.claude
  printf '%s' "$CLAUDE_CREDENTIALS" > ~/.claude/.credentials.json
  chmod 600 ~/.claude/.credentials.json
else
  echo "CLAUDE_CREDENTIALS not set; skipping credential restore."
fi

# 3. Restore account identity into ~/.claude.json (merged, so claude treats
#    this as an already-logged-in, onboarded install instead of a first run).
if [ -n "$CLAUDE_ACCOUNT" ]; then
  echo "Restoring Claude account identity..."
  python3 - <<'PY'
import json, os
path = os.path.expanduser('~/.claude.json')
try:
    with open(path) as f:
        data = json.load(f)
except (FileNotFoundError, json.JSONDecodeError):
    data = {}
data.update(json.loads(os.environ['CLAUDE_ACCOUNT']))
with open(path, 'w') as f:
    json.dump(data, f)
PY
  echo "Claude account identity restored."
else
  echo "CLAUDE_ACCOUNT not set; skipping identity restore."
fi
