---
name: setup-workspace
description: >-
  Set up a customizable local project workspace for a knowledge worker so any AI agent (Claude, Codex, Cursor, etc.) can work alongside them. Use this skill ONLY when the user explicitly asks to set up, scaffold, or reorganize a workspace for human-agent collaboration — e.g. "set up my workspace," "organize my project folders for working with AI," or "create an AGENTS.md/CLAUDE.md + work-memory/templates structure." Do NOT trigger for general file tidying, one-off document creation, or routine project work. When invoked, it interviews the person about their role, projects, tools, and working style, then proposes and scaffolds (with confirmation) a tailored folder structure plus a portable context-and-process layer (work-memory, templates, connectors map, AGENTS.md). Ships presets for ten common roles (PM, UX researcher, instructional designer, software engineer, UI designer, marketer, HR, success coach, enrollment coach, executive assistant) plus a generative fallback.
metadata:
  version: 1.0.0
---

# Set Up Workspace

Help a knowledge worker stand up a local workspace that is the **context-and-process layer for human–agent collaboration**: a place where their files, their way of working, and their cloud tools all sit together so any agent can pick up work fast and do things that time constraints would otherwise make impossible.

This skill is **portable across agents** (Claude, Codex, Cursor…) because it centers on plain files — `AGENTS.md` and a small set of folders — not any one tool's config.

## Mental model: two layers
A good workspace separates what's constant from what varies by role:

- **Universal layer (same for everyone):** the context + process layer.
  - `work-memory/` — how the person works + the agent's self-improvement log
  - `templates/` — their reusable formats
  - `connectors/` — map of which cloud tools they use and what each owns
  - `AGENTS.md` (+ `CLAUDE.md` pointer) — the rules every agent reads first
- **Role layer (tailored):** the project / artifact folders and which starter templates apply. This is what the interview adapts.

Bundled in this skill:
- `assets/universal/` — starter files for the universal layer (genericized; fill in during the interview).
- `assets/presets/` — one md per role (PM, UX researcher, instructional designer, software engineer, UI designer, marketer, HR manager/assistant, success coach, enrollment coach, executive assistant). Each has: *When to use · Suggested structure · Recommended templates · AGENTS.md role snippet · Tailoring notes*.
- `references/method.md` — principles for generating a structure when no preset fits (the **generative fallback**) and for tailoring any preset well.
- `assets/project-skills/` — installable **project skills** (`asu-edplus-design-system`, `brainstorm`, `to-prd`, `to-issues`) to drop into each agent's skills directory (`.claude/skills/`, `.agents/skills/`, `.cursor/skills/`) so any agent can discover them. See `references/project-skills.md`.

## The process (interview → propose → scaffold with confirm)

Don't dump folders on the person. Work through these four steps.

### 1. Interview
Gather just enough to tailor. Ask in small batches, not all at once:
- **Role & context** — their role/title, team, what they're responsible for.
- **Projects & work** — current projects, recurring work, the artifacts they produce (PRDs, reports, designs, lesson plans, outreach, etc.).
- **How they work** — cadence, what they want to spend time on vs. delegate, formatting/tone preferences.
- **Tools** — which cloud tools they use (docs, design, meetings, email, calendar, chat, tickets, CRM/SIS) and which are actually connected vs. not-yet-approved.
- **Templates** — do they have existing formats to bring in? (Offer: "paste them into `templates/` and I'll standardize them, or we build them together.")

Map their role to a preset in `assets/presets/`. If it fits, read that preset. If nothing fits or it's a hybrid, use `references/method.md` to generate a bespoke structure. The universal layer always applies.

### 2. Propose
Show the proposed structure **before building** — a clear folder tree plus a one-line purpose per folder, and note what came from the preset vs. what you tailored to their projects. Invite edits. People react far better to a concrete tree they can tweak than to an interview that ends in empty folders.

### 3. Confirm (dry run)
For any **existing** files or a non-empty target folder, present an explicit move/create plan and get a yes before touching anything. Move rather than delete; surface anything irreversible. (If the environment guards deletes, request permission rather than reporting it as impossible.) Add a `.gitignore` so dependencies/secrets/OS-junk (`node_modules/`, `.venv/`, `.env`, `.DS_Store`) never sync to cloud storage.

### 4. Scaffold
Create the folders and **seed real files**, not empty dirs:
- Copy the universal layer from `assets/universal/` and fill in the person's specifics (role focus, tools, preferences) from the interview.
- Drop in the preset's suggested structure + recommended templates, renamed/tailored to their actual projects.
- Write `AGENTS.md` from the universal skeleton + the preset's role snippet + their answers; add the `CLAUDE.md` pointer.
- Populate `connectors/CONNECTORS.md` with their tools and connection status (mark unapproved tools clearly so agents don't assume they work).
- Seed `work-memory/` so it's usable on day one, and tell them the loop: the agent reads `work-memory/` at the start of a session and appends to `work-memory/lessons.md` at the end.
- **Install project skills into every agent's directory:** copy the relevant skills from `assets/project-skills/` into **each** agent's skills directory at the project root, so whichever agent the person uses discovers them:
  - `.claude/skills/<name>/` (Claude Code)
  - `.agents/skills/<name>/` (Codex — also read by Cursor)
  - `.cursor/skills/<name>/` (Cursor)

  Each bundled skill stores its instructions as `SKILL.md.txt` — **rename to `SKILL.md`** in every copy. Then list the installed skills in `AGENTS.md` (the universal index every agent reads), and ensure `.claude/`, `.agents/`, and `.cursor/` are **not** git-ignored. See `references/project-skills.md` for the full table, the dedup option, and which skills to include per role.

End by telling them how to keep it healthy: capture new work in the right project folder, add decisions to the decision log, and update `connectors/` when a tool gets connected.

## Principles (carry these into every setup)
- **Opinionated but not rigid.** Start from a strong default (preset or generated), then bend it to the person. Never hand back blank folders.
- **Files over config.** The value is portable plain-text context, not a lock-in to one agent.
- **Seed, don't stub.** A seeded `work-memory/how-i-work.md` is worth more than ten empty directories.
- **Name the layers.** Keep the universal layer recognizable across people so any agent knows where to look.
- **Honor reality.** Mark which tools are actually connected; don't promise integrations that need approval.

## Pair with other skills
If the person produces branded/visual work for a specific org, suggest pairing with that org's design-system skill (e.g. `edplus-asu-design-system`) so scaffolded artifacts come out on-brand.
