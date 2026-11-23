---
name: hugo-site-manager
description: Manage, audit, preview, and build Hugo sites. Use when creating or editing Hugo content, validating front matter, changing templates or configuration, diagnosing build failures, preparing a release, or checking a Hugo site before deployment.
---

# Hugo Site Manager

Use this Skill to make small, verifiable changes to a Hugo site through the Hugo
CLI. Treat source content and configuration as authoritative. Never edit generated
output directly.

## Preconditions

1. Locate the repository root and read `AGENTS.md` when it exists.
2. Run `hugo version`.
3. Stop and report the missing prerequisite when Hugo is unavailable.
4. Inspect `hugo.toml`, `config.toml`, or `config/_default/`.
5. Read nearby content or templates before editing.
6. Read `references/content-rules.md` when the task changes content.

## Classify the request

Choose one primary workflow:

- Content: create or update Markdown and front matter.
- Template: update layouts, partials, shortcodes, or static assets.
- Configuration: update Hugo configuration or module settings.
- Audit: inspect the site without changing source files.
- Preview: run a local development server.
- Release: build production output and summarize readiness.
- Deploy: perform an external deployment only after explicit approval.

## Content workflow

1. Inspect two nearby content files when available.
2. Preserve the repository's front matter format and field names.
3. Prefer `hugo new content <path>` when an archetype exists.
4. Keep new content as a draft unless publication is explicitly requested.
5. Validate dates, slugs, aliases, taxonomies, and referenced assets.
6. Run the verification workflow.

## Template and configuration workflow

1. Identify the template lookup path or configuration ownership.
2. Make the smallest change that satisfies the request.
3. Avoid introducing dependencies when Hugo built-ins are sufficient.
4. Check affected list, single, taxonomy, and home pages as applicable.
5. Run the verification workflow.

## Audit workflow

1. Inspect configuration, content structure, archetypes, and templates.
2. Run the verification script without modifying source files.
3. Report failures before warnings.
4. Include exact file paths and actionable remediation.
5. Do not perform cleanup that was not requested.

## Verification workflow

Run the platform-appropriate script from the Hugo repository root. Resolve the
script path relative to this Skill:

- Windows: `scripts/verify.ps1`
- Unix-like: `scripts/verify.sh`

When a script cannot run, execute:

```text
hugo --gc --minify
```

If verification fails:

1. Read the complete error output.
2. Locate the source file responsible.
3. Apply the smallest relevant fix.
4. Run verification again.
5. Stop after three unsuccessful repair attempts and report the blocker.

## Preview workflow

Run:

```text
hugo server --buildDrafts --disableFastRender
```

Keep the server running only when the user needs to inspect the site. Report the
local URL and stop the server when requested.

## Release and deployment workflow

1. Verify a production build without drafts.
2. Review the changed source files.
3. Summarize warnings and generated output.
4. Ask for approval before running any deployment command.
5. Never expose deployment credentials in logs or responses.
6. Verify the deployed result when deployment is approved and available.

## Safety boundaries

- Do not edit files under `public/` or `resources/_gen/`.
- Do not delete content without explicit approval.
- Do not publish drafts without explicit approval.
- Do not modify credentials, tokens, DNS, or production settings automatically.
- Do not run deployment commands as part of ordinary verification.
- Preserve unrelated user changes.

## Definition of done

- The requested source change is complete.
- The Hugo production build succeeds.
- Relevant warnings are resolved or reported.
- Changed files and verification commands are summarized.
- No deployment or destructive action occurred without approval.
