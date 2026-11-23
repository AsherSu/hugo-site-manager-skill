# Hugo Content Rules

## Front matter

- Preserve the format used by nearby content.
- Use an explicit title.
- Use an ISO 8601 date with timezone when the repository does so.
- Keep new content as `draft = true` unless publication is requested.
- Use stable, lowercase taxonomy values unless the repository uses another convention.
- Do not invent aliases, canonical URLs, authors, or SEO metadata.

## Content structure

- Prefer the existing leaf-bundle or branch-bundle convention.
- Store page-specific assets beside content only when nearby pages do the same.
- Keep summaries before `<!--more-->` when the repository uses summary separators.
- Use root-relative or Hugo-aware links for internal content.
- Do not link to generated `public/` paths.

## Review checklist

- The title matches the content.
- The date and draft status are intentional.
- Referenced images and downloads exist.
- Internal links target valid content.
- Markdown headings have a logical hierarchy.
- No credentials, personal secrets, or local absolute paths were added.
