# dotfiles

Personal setup scripts. The main job here is installing [Claude Code](https://claude.ai/code)
so I can run `claude` from any repo without remembering the install command each time.

## What `install.sh` does

Installs the Claude Code CLI:

```bash
curl -fsSL https://claude.ai/install.sh | bash
```

## Usage

### On a regular machine (laptop / server)

Run this once per machine:

```bash
curl -fsSL https://raw.githubusercontent.com/creatorofrealitiess/dotfiles/main/install.sh | bash
```

Then, in any repo, start Claude Code with:

```bash
claude
```

You also need to be signed in to Claude (Claude subscription or Anthropic API key) the
first time — that authorizes the AI itself and is separate from any GitHub login.

### In GitHub Codespaces (automatic — no manual install)

GitHub Codespaces can auto-run this repo's `install.sh` on every new Codespace:

1. Go to <https://github.com/settings/codespaces>
2. Under **Dotfiles**, check **Automatically install dotfiles**
3. Point it at the `creatorofrealitiess/dotfiles` repo

After that, Claude Code is installed automatically in every new Codespace — just run `claude`.

## Notes

- `install.sh` is committed with the executable bit set (`chmod +x`).
- Installing the CLI ≠ signing in. The CLI is the program; the Claude sign-in is what
  authorizes the AI.
