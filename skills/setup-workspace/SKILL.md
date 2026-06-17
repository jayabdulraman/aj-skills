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
  - `work-memory/` — five files that give any agent instant context:
    - `work-profile.md` — role, responsibilities, working style, preferences, and delegation model in one place
    - `daily_log.md` — sparse tabular log of work done each session (agent appends a row after completing meaningful work)
    - `glossary.md` — org, project, workstream, and domain terms so agents never misread shorthand
    - `decision-log.md` — running log of decisions; auto-populated from Granola or Zoom if connected, also manually writable
    - `lessons.md` — agent self-improvement log; captures durable patterns, corrections, and workspace hygiene fixes across sessions
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

Don't dump folders on the person. Work through these five steps.

### 1. Interview — start from memory, then ask the right way

**First, use what you already know.** Before asking anything, pull together what you already know about this person — from your memory of them, this conversation, and any connected tools (email, calendar, docs, meeting notes, past work). Draft their likely **role, responsibilities, current projects, and working preferences**, then open by surfacing that draft for them to correct and extend: *"Here's what I already know about you — tell me what's off and what I'm missing."* This respects their time and turns a cold interrogation into a quick confirmation.

**Then fill the gaps — and match the question type to the question.** This is important: do **not** funnel everything through multiple-choice. Invented options for things you can't know will be wrong and frustrating (e.g. a multi-select of guessed project names).

- **Ask open-ended (free text)** for anything unique to the person that you can't enumerate in advance. **With each open-ended question, provide a detailed, single-paragraph example answer in italics and quotes** so they see the depth and richness of response you're after. **Generate an example that fits this particular person and role** — the samples below only illustrate the format and level of detail; don't reuse them verbatim. The open-ended questions:
  - their **role & responsibilities** — e.g. *"I'm a product manager on the AI product team at a university online-learning unit. I own discovery, strategy, and the roadmap for two products, run launches end to end, and spend most of my time aligning stakeholders, talking to users, and turning research into decisions — the rest is documentation and coordination I'd rather delegate."*
  - their **current projects** and the **work/artifacts** they produce — e.g. *"Right now I'm running two pilots — a faculty Canvas copilot and a student companion app — plus an experimental iOS prototype heading into user validation. Day to day I produce PRDs, project concepts, UX research plans and synthesis, prototypes, and launch communications, and I keep everything documented in Coda so the team can follow along."*
  - **how they like to work** — cadence, what to delegate, tone/format preferences — e.g. *"I move fast and think in prototypes rather than long documents. I want my time going to users, strategy, and making the product better, so I delegate routine documentation, status updates, meeting notes, and ticket drafting. Keep things concise and direct, give me options with a recommendation, and skip the fluff."*
  - existing **templates** to bring in — e.g. *"I already have a PRD format, a project-concept one-pager, and a user-story template in Google Docs and Coda that I reuse across projects. I'd like to bring those in as my standards, and I could use help turning my ad-hoc meeting-notes and launch-email formats into reusable templates too."* (Offer: "paste them into `templates/` and I'll standardize them, or we build them together.")
  Let them answer in their own words. Never offer preset choices for these.

- **Use multiple choice (the AskUserQuestion tool)** only for questions with a **known, finite** set of answers:
  - which **agents** they use — Claude / Codex / Cursor
  - which **tools/connectors** they use — from the standard list (docs, design, meeting notes, email, calendar, chat, tickets, CRM/SIS)
  - whether to include a capture **inbox** (`00-inbox/`) — **explain it briefly when you ask**: a single drop-zone folder (the `00-` sorts it to the top of the file list) where unsorted things land first — a quick note, a dumped meeting transcript, a screenshot — to be filed into the right project later. It kills root-level clutter and the "where do I put this right now" hesitation. Optional; skip it if they'd rather file directly.
  - **confirming the role preset** you matched them to
  - which **project skills** to install
  - **scaffold now vs. produce a dry-run plan first**

Lead with the memory draft and open-ended confirmation; bring in multiple-choice only for the finite decisions, near the end. Ask in small batches, not all at once.

**Take stock of what's actually available in their environment.** During setup, review which **connectors / MCP tools, plugins, and skills** the person can access right now versus which are **off or not yet approved**, and surface it plainly — e.g. "these are connected and ready, these are installed but off, these need admin approval." This grounds the connectors map in reality and tells you which integrations you can wire up now vs. flag as pending.

Map their role to a preset in `assets/presets/`. If it fits, read that preset. If nothing fits or it's a hybrid, use `references/method.md` to generate a bespoke structure. The universal layer always applies.

### 2. Propose
First, settle the **workspace root**: a single named parent folder that everything lives under — the projects, the universal layer, and the agent skill directories. **Suggest the name with the AskUserQuestion tool**: offer one recommended option (a sensible default such as `Firstname-Workspace/`, e.g. `Kelly-Workspace/`) and let them use the tool's built-in *Other* choice to type a different name. Confirm **where it should live** — and make sure that location is **real and visible to the person on their own computer**, not a temporary or sandbox path. Some agents (e.g. Cowork) can only write to the user's machine through a folder the user has **connected/attached** to the session; files written anywhere else (an isolated sandbox path) won't appear in their file browser. So: (1) ask where they want it — Desktop, Documents, Downloads, or inside an existing project folder; (2) verify you can actually write there. **If the folder isn't attached or you lack access, ask the person to attach or grant access to that folder first**, then create the workspace there. Never scaffold into a path the user can't see, and don't dump it into an unrelated existing folder.

Then show the proposed structure **before building** — a clear folder tree plus a one-line purpose per folder, and note what came from the preset vs. what you tailored to their projects. Invite edits. People react far better to a concrete tree they can tweak than to an interview that ends in empty folders.

### 3. Confirm (dry run)
For any **existing** files or a non-empty target folder, present an explicit move/create plan and get a yes before touching anything. Move rather than delete; surface anything irreversible. (If the environment guards deletes, request permission rather than reporting it as impossible.)

**Keep clutter out — but only as much as the workspace actually needs.** Two kinds pile up:
- **OS junk** like `.DS_Store` (macOS view-setting files — pure noise). Always safe to delete; nobody edits these.
- **Regenerable build folders** like `node_modules/` or `.venv/` — these *only appear in workspaces that contain code/prototypes.* They're often huge and are recreated with one command, so they aren't "the person's work." Most non-engineering workspaces never have them.

Add a `.gitignore` listing these **only if** the workspace is (or will be) under git/GitHub — that tells git to skip them. **Important caveat:** a `.gitignore` does **not** stop Dropbox / iCloud / OneDrive from syncing those files — cloud sync ignores it. So for a cloud-synced workspace the real fix is to **keep regenerable deps and secrets (`.env`) out of the folder** (and use the sync tool's own ignore if needed), not just list them. For a plain docs workspace, skip the `.gitignore` entirely — there's nothing to ignore.

### 4. Scaffold

**Before building anything, surface the full task list.** Use the TaskCreate tool to create one task per major step — e.g. "Create folder structure", "Write AGENTS.md and CLAUDE.md", "Seed work-memory files", "Write templates", "Write CONNECTORS.md", "Install project skills", "Verify and hand off". This makes progress visible to the person as you work. Mark each task `in_progress` when you start it and `completed` when done. The person can follow along without asking "what's happening."

Create the named **workspace root folder** first, in the **confirmed, user-visible location** (not a sandbox/temp path) — if you can't write there, stop and ask the person to attach the folder. Then build everything inside it. Seed **real files**, not empty dirs:
- Copy the universal layer from `assets/universal/` and fill in the person's specifics (role focus, tools, preferences) from the interview.
- Drop in the preset's suggested structure + recommended templates, renamed/tailored to their actual projects. When you add **default templates or starter files**, say so plainly and cite the role **preset** as the reason ("these came from your [role] preset as a starting point") — the person can replace them with their own (paste into `templates/`) or build better ones with you.
- Write `AGENTS.md` from the universal skeleton + the preset's role snippet + their answers; add the `CLAUDE.md` pointer.
- Populate `connectors/CONNECTORS.md` with their tools and connection status (mark unapproved tools clearly so agents don't assume they work).
- **Seed `work-memory/`** with four files, filled in from the interview:
  - `work-profile.md` — write the person's role, responsibilities, active projects, working style, delegation model, and communication preferences. This is the single file an agent reads to orient itself; make it accurate and specific, not generic.
  - `daily_log.md` — create with a header row and **write the first entry immediately upon completing setup** (date = today, work = "Workspace setup", why = brief description of what was scaffolded). The table is sparse — only rows for days where the agent did meaningful work. Format:
    ```
    | Date       | Work done                        | Why / context                        |
    |------------|----------------------------------|--------------------------------------|
    | YYYY-MM-DD | [what the agent did or produced] | [the goal or reason behind the work] |
    ```
  - `glossary.md` — seed with any org, project, workstream, or domain terms gathered during the interview (product names, team names, acronyms, shorthand). Agents append new terms as they encounter them.
  - `decision-log.md` — seed with any decisions surfaced during setup. If **Granola or Zoom is connected**, after setup completes, query recent meeting transcripts for decisions and append them (date, decision, context, source meeting). Mark the source so it's clear what came from a meeting vs. what the person wrote directly. If neither is connected, leave a placeholder row and note which tool to connect to enable auto-population.

  - `lessons.md` — seed with one entry marking the workspace creation. Agents append here when they catch a pattern, preference, or mistake worth remembering. If a lesson gets stable enough to belong in `work-profile.md`, move it there and remove it from `lessons.md`.

  Tell the person the loop: at the **start** of a session the agent reads `work-memory/` to orient. At the **end**, it appends a row to `daily_log.md`, any new terms to `glossary.md`, any decisions to `decision-log.md`, and any durable behavioral learnings to `lessons.md`.
- **Install project skills into every agent's directory:** copy the relevant skills from `assets/project-skills/` into **each** agent's skills directory at the project root, so whichever agent the person uses discovers them:
  - `.claude/skills/<name>/` (Claude Code)
  - `.agents/skills/<name>/` (Codex — also read by Cursor)
  - `.cursor/skills/<name>/` (Cursor)

  Each bundled skill stores its instructions as `SKILL.md.txt` — **rename to `SKILL.md`** in every copy. Then list the installed skills in `AGENTS.md` (the universal index every agent reads), and ensure `.claude/`, `.agents/`, and `.cursor/` are **not** git-ignored. See `references/project-skills.md` for the full table, the dedup option, and which skills to include per role.

  **Critical: use the safe copy pattern, not `cp -r`.** Plugin skill sources are mounted read-only (`0500` dirs, `0400` files). `cp -r` propagates those restrictive permissions onto the destination — newly created subdirectories land as `0500` (no write), so subsequent file writes into them fail silently or with permission errors. The fix is pure bash — no Python or external dependencies required:

  ```bash
  install_skill() {
    local src="$1"   # e.g. /path/to/plugin/skills/brainstorm
    local dst="$2"   # e.g. /workspace/.claude/skills/brainstorm

    # 1. Pre-create all destination dirs with default (writable) permissions
    find "$src" -type d | while IFS= read -r dir; do
      mkdir -p "$dst/${dir#$src/}"
    done

    # 2. Copy each file individually and explicitly mark it writable
    find "$src" -type f | while IFS= read -r file; do
      rel="${file#$src/}"
      dst_file="$dst/${rel/SKILL.md.txt/SKILL.md}"   # rename on the fly
      cp "$file" "$dst_file"
      chmod u+rw "$dst_file"
    done
  }
  ```

  Why this works: `mkdir -p` creates directories with the process's default umask (writable). Copying files one-at-a-time with an explicit `chmod u+rw` after each ensures nothing inherits the source's `0400` read-only permission. Do **not** use `cp -r`, `cp --no-preserve=mode`, `shutil.copy2`, or any approach that creates the directory tree from the read-only source in a single pass — all of them reproduce the permission problem. `shutil.copy` (Python, not `copy2`) also works if Python is available, but the bash pattern above is universal and requires no dependencies.

### 5. Hand off with next steps
After a successful setup, don't just stop — give the person a short, prioritized list of what to do next, tailored to them. Typically:
- **Templates** — if they already have formats, point them to the exact folder to paste them in (`templates/`) and offer to standardize them; if not, offer to build their top one or two together now.
- **Connectors** — name the specific tools to connect or get approved (from the availability review) and what each unlocks once live.
- **Skills/plugins** — flag any that are off or missing and how to enable or install them.
- **Review work-profile** — invite them to open `work-memory/work-profile.md`, correct anything that's off, and add detail the interview didn't cover. This is the file every agent reads first; accuracy here multiplies across every future session.
- **A concrete first task** — suggest one real thing to do now (e.g. draft a PRD from a template, or have the agent digest a folder of notes) so the workspace pays off immediately.

Keep it to a handful of actionable items so they know exactly what to do next.

Also tell them how to keep it healthy over time: capture new work in the right project folder, add decisions to the decision log, and update `connectors/` when a tool gets connected.

## Principles (carry these into every setup)
- **Opinionated but not rigid.** Start from a strong default (preset or generated), then bend it to the person. Never hand back blank folders.
- **Files over config.** The value is portable plain-text context, not a lock-in to one agent.
- **Seed, don't stub.** A seeded `work-memory/work-profile.md` is worth more than ten empty directories. Write the first `daily_log.md` row on setup completion — don't leave it blank for the user to start.
- **Label what's a default.** Whenever you generate *any* starter, example, or preset-derived content — templates, `work-memory` entries, the `connectors` map, sample docs, the folder structure itself, AGENTS.md role text — tell the person plainly that it's a starting point drawn from their role **preset / defaults**, not something they authored or a finished artifact. For each, make clear they can keep it, edit it, replace it with their own, or build it with you. Never present generated defaults as if they were the person's own settled choices.
- **Name the layers.** Keep the universal layer recognizable across people so any agent knows where to look.
- **Honor reality.** Mark which tools are actually connected; don't promise integrations that need approval.

## Pair with other skills
If the person produces branded/visual work for a specific org, suggest pairing with that org's design-system skill (e.g. `edplus-asu-design-system`) so scaffolded artifacts come out on-brand.
