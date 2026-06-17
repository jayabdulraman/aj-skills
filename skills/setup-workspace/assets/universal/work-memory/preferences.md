# Preferences

_Formatting, tone, and conventions the agent should default to._

## Communication
- [Concise and direct? More detail? Lead with the answer?]
- Give options with a recommendation when there's a real tradeoff.

## Documents
- Follow the formats in `templates/`.
- [Skimmable summaries up top? Brand to apply?]

## File & naming conventions
- Notes: `lowercase-kebab-case.md`. Formal deliverables: `Title-Case-Hyphenated` OK.
- Dates: `YYYY-MM-DD` (no placeholder `XX`).
- Avoid spaces, en-dashes, and leading `#` in filenames.

## Where things go
- Reusable format → `templates/` · Retired work → `archive/`
- Don't recreate `node_modules/`, `.venv/`, or secrets in a synced folder (see `.gitignore`).
