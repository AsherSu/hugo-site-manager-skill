# Hugo Site Manager Skill

A reusable Codex Agent Skill for managing, auditing, previewing, and building
Hugo sites with the Hugo CLI.

## Install

Clone this repository into a project's Skill directory:

```powershell
git clone https://github.com/AsherSu/hugo-site-manager-skill.git `
  .agents/skills/hugo-site-manager
```

Or install it for the current user:

```powershell
git clone https://github.com/AsherSu/hugo-site-manager-skill.git `
  "$HOME/.agents/skills/hugo-site-manager"
```

Hugo must be installed and available on `PATH`:

```powershell
hugo version
```

## Use

Start Codex in a Hugo repository and invoke:

```text
$hugo-site-manager audit this site and fix build errors, but do not deploy
```

Codex may also select the Skill automatically when a request matches the
description in `SKILL.md`.

## Included workflows

- Content creation and front matter validation.
- Template and configuration changes.
- Read-only site audits.
- Local preview with drafts.
- Production build verification.
- Approval gates for deployment and destructive changes.
