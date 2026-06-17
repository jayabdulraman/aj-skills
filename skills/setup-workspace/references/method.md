# Method — generating & tailoring a workspace structure

Read this when no preset cleanly fits the person (an unusual role, or a hybrid like "PM who also runs research"), or to tailor any preset well. The goal is a structure the person recognizes as *theirs* on first look.

## Step 1 — find the person's primitives
From the interview, extract three things:
1. **Outputs** — the artifacts they produce repeatedly (PRDs, reports, designs, lesson plans, briefs, outreach sequences, dashboards, case notes…).
2. **Units of work** — how they mentally group work (by project, by client/student, by course, by campaign, by sprint, by account).
3. **Inputs/context** — what they need on hand (meeting notes, research, data, source docs, briefs).

## Step 2 — pick the top-level organizing axis
Most roles cluster into one of these. Pick the one that matches how they *talk* about their work:
- **By project** — discrete, time-bound initiatives (PM, engineer, designer). Folders per project, artifacts inside.
- **By person/account** — recurring relationships (success coach, enrollment coach, account manager). Folders per cohort/account.
- **By artifact type** — output-heavy roles producing many of the same thing (instructional designer with many courses, marketer with many campaigns). Folders per type, then per instance.
- **By time/cadence** — operations/EA work driven by the calendar. Folders per period or per recurring duty.

Don't overthink it — you can blend (e.g., `projects/` + a `clients/` area). Just don't create an axis they didn't ask for.

## Step 3 — apply the universal layer (always)
Every workspace gets: `work-memory/`, `templates/`, `connectors/`, `AGENTS.md` + `CLAUDE.md`. These don't change by role.

## Step 4 — add a capture + archive habit
- A single capture spot (e.g. `00-inbox/`) is optional but helps people who capture fast and sort later. Offer it; skip it if they'd rather file directly.
- Always include `archive/` so finished/dormant work leaves the daily view without being deleted.

## Step 5 — keep presets honest
- Presets are **starting points**, not contracts. Rename folders to the person's real projects, drop sections they don't need, add ones they do.
- Keep each preset light: a skeleton + which templates + a role snippet for `AGENTS.md`. If you find yourself writing heavy role-specific logic, it probably belongs in the generated tailoring, not the preset.

## Anti-patterns
- Empty folders with no seeded files → seed real starter content.
- An axis the person never mentioned (don't impose "workstreams" or "sprints" on someone who doesn't think that way).
- Burying the thing they touch most (if they prototype daily, keep prototypes prominent; if they live in client notes, surface those).
- Duplicating the universal layer per project — it lives once at the top.
