# AGENTS.md — Workspace Rules (single source of truth)

> Canonical rules for this workspace. `CLAUDE.md` (and any other agent config) points here. Fill in the [bracketed] parts during setup.

## Who I am
[Name] — [role] at [team/org]. Responsible for [scope]. I work with AI agents as co-thinkers and implementers to take routine work off my plate so I can focus on [the high-value work I care about].

## Start-of-session protocol
1. Read **`work-memory/`** (`how-i-work.md`, `preferences.md`, `decision-log.md`, `glossary.md`, `lessons.md`) to work the way I work.
2. Check existing context before asking questions: local files first, then connected tools (see `connectors/CONNECTORS.md`).
3. At the **end** of a session, append durable learnings to **`work-memory/lessons.md`**.

## Directory structure
[Describe the top-level folders and what each holds — generated during setup from the chosen preset/structure.]

### Universal layer
- **work-memory/** — how I work + the agent self-improvement log. Read at start, append lessons at end.
- **templates/** — my reusable formats. Start new docs from these.
- **connectors/** — `CONNECTORS.md`: which tools I use, what each owns, connection status.
- **archive/** — finished/dormant work. Archive, don't delete.

## Documentation & tools
- Source of truth for shared docs: [tool, e.g. Coda/Notion/Google Docs].
- When creating a doc, ask: "[shared tool] or local first?"
- Respect connection status in `connectors/CONNECTORS.md` — don't call tools marked pending/unapproved.

## How to work with me
- [Tone/format preferences — see work-memory/preferences.md]
- Give me options + a recommendation when there's a real tradeoff.
- Check context before asking; surface a recommendation, not just a menu.

## Project skills
This workspace ships skills that any agent can use here:
- [skill] — [what it unlocks]
- [skill] — [what it unlocks]

The same skills are installed in each agent's directory so they're discoverable regardless of tool:
- **Claude Code** → `.claude/skills/`
- **Codex** → `.agents/skills/`
- **Cursor** → `.cursor/skills/` (Cursor also reads `.agents/skills/`)

Each is searched from the working dir up to the project root. Keep `.claude/`, `.agents/`, and `.cursor/` out of `.gitignore` so the skills travel with the workspace.

## Hygiene
- Never recreate `node_modules/`, `.venv/`, or secrets in a synced folder — see `.gitignore`.
- Filenames: `lowercase-kebab.md` for notes; dates as `YYYY-MM-DD`; no spaces/leading `#`.
