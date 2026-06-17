# AJ Skills

Reusable Agent Skills for Codex, Claude Code, Cursor, and other tools that understand the open `SKILL.md` skill format.

## Prompt: Install All Skills

Copy this prompt into Codex, Claude Code, Cursor, or another coding agent:

```text
Install all skills from this Agent Skills repository:
https://github.com/jayabdulraman/aj-skills

Please:
1. Read README.md and skills.json first.
2. Install every skill listed in skills.json.
3. Install at user scope for the agent I am currently using.
4. Preserve each entire skill folder exactly, including SKILL.md, references, assets, scripts, and agents metadata.
5. If you can run shell commands, use scripts/install-skill.sh. If not, manually copy each skills/<skill-name>/ folder into the correct user skills directory.
6. Tell me which skills were installed and where.
```

## Prompt: Install One Skill

Replace `setup-workspace` with any skill name from the catalog:

```text
Install only the setup-workspace skill from this Agent Skills repository:
https://github.com/jayabdulraman/aj-skills

Please:
1. Read README.md and skills.json first.
2. Find the setup-workspace entry in skills.json.
3. Install only skills/setup-workspace.
4. Install at user scope for the agent I am currently using.
5. Preserve the entire setup-workspace folder exactly, including SKILL.md, references, assets, scripts, and agents metadata.
6. If you can run shell commands, use scripts/install-skill.sh setup-workspace. If not, manually copy skills/setup-workspace/ into the correct user skills directory.
7. Tell me where setup-workspace was installed.
```

Available skill names are `brainstorm`, `illustrations`, `setup-workspace`, and `to-prd`.

## User Skill Directories

If the agent installs manually, use the directory for the current tool:

| Agent | User scope directory |
| --- | --- |
| Codex | `~/.agents/skills/<skill-name>/` |
| Claude Code | `~/.claude/skills/<skill-name>/` |
| Cursor | `~/.cursor/skills/<skill-name>/` |

## Install All Skills From The Command Line

From a clone:

```bash
git clone https://github.com/jayabdulraman/aj-skills.git
cd aj-skills
./scripts/install-skill.sh all --agent all --scope user
```

Or have an agent inspect and run the installer directly from GitHub:

```bash
curl -fsSL https://raw.githubusercontent.com/jayabdulraman/aj-skills/main/scripts/install-skill.sh -o /tmp/aj-skills-install.sh
bash /tmp/aj-skills-install.sh all --agent all --scope user
```

## Install One Skill From The Command Line

From a clone, pass the skill name instead of `all`:

```bash
./scripts/install-skill.sh setup-workspace --agent all --scope user
```

Install one skill for a specific agent:

```bash
./scripts/install-skill.sh brainstorm --agent codex --scope user
./scripts/install-skill.sh setup-workspace --agent claude --scope user
./scripts/install-skill.sh illustrations --agent cursor --scope user
```

Install one skill into a project or custom directory:

```bash
./scripts/install-skill.sh setup-workspace --agent all --scope project
./scripts/install-skill.sh setup-workspace --target ~/.agents/skills
```

List available skills:

```bash
./scripts/install-skill.sh --list
```

## Skill Catalog

The machine-readable catalog is in [`skills.json`](skills.json). Agents should use it to discover available skills, descriptions, source paths, and install targets.

| Skill | Use when |
| --- | --- |
| [`brainstorm`](skills/brainstorm/SKILL.md) | The user wants to think through a problem, explore options, make a decision, or ideate before acting. |
| [`illustrations`](skills/illustrations/SKILL.md) | The user wants clean, absurd, hand-drawn English article illustrations or shot lists. |
| [`setup-workspace`](skills/setup-workspace/SKILL.md) | The user explicitly asks to set up or reorganize a local workspace for human-agent collaboration. |
| [`to-prd`](skills/to-prd/SKILL.md) | The user wants to turn current context into a PRD and publish it to an issue tracker. |

## Default Install Locations

The installer uses these defaults:

| Agent | User scope | Project scope |
| --- | --- | --- |
| Codex | `~/.agents/skills/<skill-name>/` | `.agents/skills/<skill-name>/` |
| Claude Code | `~/.claude/skills/<skill-name>/` | `.claude/skills/<skill-name>/` |
| Cursor | `~/.cursor/skills/<skill-name>/` | `.cursor/skills/<skill-name>/` |

For a custom location, pass `--target /path/to/skills-dir`. The installer copies each selected skill into `/path/to/skills-dir/<skill-name>/`.

## Agent Installation Contract

If an agent cannot run the installer, it can install manually:

1. Clone or download this repository.
2. Pick a folder under `skills/<skill-name>/`.
3. Verify the folder contains `SKILL.md`.
4. Copy the entire skill folder into the target skills directory.
5. Preserve all subdirectories such as `references/`, `assets/`, `scripts/`, and `agents/`.
6. Restart or reload the coding agent if the skill does not appear immediately.

Do not copy only `SKILL.md`; bundled files are part of the skill.

## Format References

- [Agent Skills specification](https://agentskills.io/specification)
- [Codex Agent Skills docs](https://developers.openai.com/codex/skills)
- [Claude Code Skills docs](https://code.claude.com/docs/en/skills)
- [Cursor Skills docs](https://cursor.com/docs/skills)
