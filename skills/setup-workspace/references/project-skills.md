# Project skills — bundling & placement

This skill ships a set of **project skills** in `assets/project-skills/`. During scaffold, install them into **every supported agent's skills directory** at the project root, so whichever agent the person uses (Claude, Codex, Cursor) discovers them.

## Where they go — one folder per agent
Each agent auto-discovers skills from its own directory. Install into all of them:

| Agent | Skills directory (project root) | Notes |
|---|---|---|
| **Claude Code** | `.claude/skills/<name>/SKILL.md` | Searched from working dir up to repo root. |
| **Codex** | `.agents/skills/<name>/SKILL.md` | Scanned cwd → repo root. `.agents/` is the cross-tool convention. |
| **Cursor** | `.cursor/skills/<name>/SKILL.md` | Cursor loads from **both** `.cursor/skills/` and `.agents/skills/`. |

Resulting layout:
```
<workspace-root>/
├── AGENTS.md                      # universal index — lists the skills (read by all agents)
├── .claude/skills/   <name>/SKILL.md  (+ assets/ + references/)
├── .agents/skills/   <name>/SKILL.md
└── .cursor/skills/   <name>/SKILL.md
```

Each `<name>/` folder is the full skill (its `SKILL.md` plus any `assets/` and `references/`), copied identically into each location.

> Dedup option: because Cursor also reads `.agents/skills/`, you *can* skip `.cursor/skills/` and rely on `.agents/skills/` for both Codex and Cursor. Default is to populate all three explicitly so each agent's own directory is present; mention the dedup option if the bundled skills are large (e.g. the design-system skill is ~7 MB per copy).

## Why these locations
- Each agent searches its skills directory from the working dir up to the repo root, so starting in a subfolder still finds root-level skills.
- Skills are **committed alongside the project** so they travel with it. Project-level skills take priority over personal (`~/.claude/skills/`, `~/.agents/skills/`) skills of the same name.
- **Critical:** do **not** git-ignore `.claude/`, `.agents/`, or `.cursor/`, or the skills won't be shared. The universal `.gitignore` only ignores `node_modules/`, `.venv/`, secrets, and OS junk — never these.

## The universal index: AGENTS.md
`AGENTS.md` is an open standard read natively by Codex, Cursor, Copilot, Gemini CLI, Aider, Windsurf, and Zed. The scaffolded `AGENTS.md` **lists the installed project skills and what each does**, pointing to the per-agent directories. This guarantees the capabilities are advertised even where native skill auto-discovery differs or lags.

## Installing them (important)
In this skill's bundle, each project skill stores its instructions as **`SKILL.md.txt`**, not `SKILL.md` (a skill package can't contain nested `SKILL.md` files). When you install into an agent directory, copy the whole folder and **rename `SKILL.md.txt` → `SKILL.md`**. Everything else (`assets/`, `references/`) copies across unchanged.

## The bundled catalog
| Skill | What it does | When to include |
|---|---|---|
| `asu-edplus-design-system` | Apply/audit EdPlus-at-ASU branding (colors, type, spacing, components, accessibility); brand assets baked in | ASU/EdPlus workspaces, or any role that produces visual/branded work |
| `brainstorm` | Structured thinking-partner mode for exploring and converging on decisions | Broadly useful — most knowledge workers |
| `to-prd` | Turn conversation context into a PRD and publish it to the issue tracker | Product/strategy roles |
| `to-issues` | Break a plan/PRD into independently-grabbable tracker issues | Roles that hand work off to a tracker |

## How to choose during setup
- Default to including all four for product-oriented workspaces; install each into all three agent directories.
- For non-product roles, include `brainstorm` plus any that match their work; skip `to-prd`/`to-issues` if they don't use an issue tracker.
- If the person isn't at ASU/EdPlus, ask before adding `asu-edplus-design-system` — it's org-specific. (When generalizing beyond EdPlus, swap in that org's design-system skill.)
- Always tell the person which skills you installed, into which agent directories, and one line on what each unlocks.
