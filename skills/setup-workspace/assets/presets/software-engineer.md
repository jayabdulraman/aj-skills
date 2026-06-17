# Preset: Software Engineer

## When to use
Role is software engineer, developer, tech lead. Writes/ships code, reviews PRs, writes design docs and runbooks. Note: code lives in its own repos — this workspace is the *context layer around* the code, not a replacement for version control.

## Suggested structure
```
projects/                 # one folder per service/repo/initiative (notes, not the repo itself)
  <project>/
    design-docs/  notes/  runbooks/  research/ (spikes)  reviews/
scratch/                  # experiments, throwaway
templates/  work-memory/  connectors/  resources/  archive/
```

## Recommended templates
design-doc (RFC) · adr (architecture decision record) · runbook · postmortem · pr-description · spike-notes

## AGENTS.md role snippet
> Focus areas: design, implementation, code review, reliability. Delegate: drafting design docs/ADRs/runbooks, summarizing PRs, writing test scaffolds, research spikes. Keep secrets out of the workspace; respect repo conventions; cite files/paths precisely. Code itself stays in version control, not here.

## Tailoring notes
Ask their stack, repo host (GitHub/GitLab), issue tracker, and CI. Strongly apply `.gitignore` hygiene (no `node_modules/`, `.venv/`, secrets in a synced folder). This workspace complements, never duplicates, their repos.
