# Repository Guidance

This repository distributes Agent Skills. Keep the skill folders compatible with the open `SKILL.md` format.

## Layout

- `skills/<skill-name>/SKILL.md` is the required entrypoint for every skill.
- `skills/<skill-name>/references/` contains optional context loaded only when needed.
- `skills/<skill-name>/assets/` contains files copied or used by the skill.
- `skills/<skill-name>/scripts/` contains executable helpers.
- `skills/<skill-name>/agents/openai.yaml` contains Codex UI metadata when useful.
- `skills.json` is the machine-readable catalog for agents and installers.
- `scripts/install-skill.sh` installs skills into Codex, Claude Code, or Cursor directories.

## Maintenance Rules

- Keep skill folder names lowercase, hyphenated, and identical to the `name` in `SKILL.md`.
- Preserve bundled assets and references when moving or installing skills.
- Update `README.md`, `skills/README.md`, and `skills.json` whenever skills are added, renamed, or removed.
- Avoid extra documentation inside individual skill folders unless the skill needs it at runtime.
- Do not commit `.DS_Store`, local caches, dependency folders, or generated throwaway outputs.
