#!/usr/bin/env bash
set -euo pipefail

REPO_URL="${AJ_SKILLS_REPO_URL:-https://github.com/jayabdulraman/aj-skills.git}"
REF="${AJ_SKILLS_REF:-main}"
AGENT="all"
SCOPE="user"
TARGET=""
REQUESTED_SKILL="all"
LIST_ONLY="false"

usage() {
  cat <<'EOF'
Install AJ Agent Skills.

Usage:
  install-skill.sh [skill-name|all] [--agent codex|claude|cursor|all] [--scope user|project]
  install-skill.sh [skill-name|all] --target /path/to/skills-dir
  install-skill.sh --list

Options:
  --agent   Agent target. Defaults to all.
  --scope   user or project. Defaults to user.
  --target  Custom skills directory. Copies to <target>/<skill-name>.
  --repo    Git repository URL used when the script is not run from a clone.
  --ref     Git branch, tag, or commit used when cloning. Defaults to main.
  --list    List available skills.
  --help    Show this help.

Examples:
  ./scripts/install-skill.sh all --agent all --scope user
  ./scripts/install-skill.sh brainstorm --agent codex --scope user
  ./scripts/install-skill.sh setup-workspace --agent claude --scope project
  ./scripts/install-skill.sh illustrations --target ~/.agents/skills
EOF
}

fail() {
  printf 'Error: %s\n' "$*" >&2
  exit 1
}

while [ "$#" -gt 0 ]; do
  case "$1" in
    --agent)
      [ "$#" -ge 2 ] || fail "--agent requires a value"
      AGENT="$2"
      shift 2
      ;;
    --scope)
      [ "$#" -ge 2 ] || fail "--scope requires a value"
      SCOPE="$2"
      shift 2
      ;;
    --target)
      [ "$#" -ge 2 ] || fail "--target requires a value"
      TARGET="$2"
      shift 2
      ;;
    --repo)
      [ "$#" -ge 2 ] || fail "--repo requires a value"
      REPO_URL="$2"
      shift 2
      ;;
    --ref)
      [ "$#" -ge 2 ] || fail "--ref requires a value"
      REF="$2"
      shift 2
      ;;
    --list)
      LIST_ONLY="true"
      shift
      ;;
    --help|-h)
      usage
      exit 0
      ;;
    --*)
      fail "unknown option $1"
      ;;
    *)
      REQUESTED_SKILL="$1"
      shift
      ;;
  esac
done

case "$AGENT" in
  codex|claude|cursor|all) ;;
  *) fail "--agent must be codex, claude, cursor, or all" ;;
esac

case "$SCOPE" in
  user|project) ;;
  *) fail "--scope must be user or project" ;;
esac

SCRIPT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
LOCAL_ROOT="$(CDPATH= cd -- "$SCRIPT_DIR/.." && pwd)"
SOURCE_ROOT="$LOCAL_ROOT"
TEMP_ROOT=""

if [ ! -d "$SOURCE_ROOT/skills" ]; then
  command -v git >/dev/null 2>&1 || fail "git is required when running installer outside a clone"
  TEMP_ROOT="$(mktemp -d)"
  git clone --depth 1 --branch "$REF" "$REPO_URL" "$TEMP_ROOT" >/dev/null 2>&1 || {
    rm -rf "$TEMP_ROOT"
    fail "could not clone $REPO_URL at $REF"
  }
  SOURCE_ROOT="$TEMP_ROOT"
fi

cleanup() {
  if [ -n "$TEMP_ROOT" ] && [ -d "$TEMP_ROOT" ]; then
    rm -rf "$TEMP_ROOT"
  fi
}
trap cleanup EXIT

list_skills() {
  find "$SOURCE_ROOT/skills" -mindepth 1 -maxdepth 1 -type d | while IFS= read -r skill_dir; do
    [ -f "$skill_dir/SKILL.md" ] || continue
    basename "$skill_dir"
  done | sort
}

if [ "$LIST_ONLY" = "true" ]; then
  list_skills
  exit 0
fi

skill_exists() {
  [ -f "$SOURCE_ROOT/skills/$1/SKILL.md" ]
}

resolve_targets() {
  if [ -n "$TARGET" ]; then
    printf '%s\n' "$TARGET"
    return
  fi

  case "$AGENT:$SCOPE" in
    codex:user) printf '%s\n' "$HOME/.agents/skills" ;;
    codex:project) printf '%s\n' ".agents/skills" ;;
    claude:user) printf '%s\n' "$HOME/.claude/skills" ;;
    claude:project) printf '%s\n' ".claude/skills" ;;
    cursor:user) printf '%s\n' "$HOME/.cursor/skills" ;;
    cursor:project) printf '%s\n' ".cursor/skills" ;;
    all:user)
      printf '%s\n' "$HOME/.agents/skills"
      printf '%s\n' "$HOME/.claude/skills"
      printf '%s\n' "$HOME/.cursor/skills"
      ;;
    all:project)
      printf '%s\n' ".agents/skills"
      printf '%s\n' ".claude/skills"
      printf '%s\n' ".cursor/skills"
      ;;
  esac
}

copy_skill() {
  skill_name="$1"
  target_base="$2"
  source_dir="$SOURCE_ROOT/skills/$skill_name"
  dest_dir="$target_base/$skill_name"
  tmp_dir="$target_base/.${skill_name}.tmp.$$"
  timestamp="$(date +%Y%m%d%H%M%S)"

  skill_exists "$skill_name" || fail "skill not found: $skill_name"
  mkdir -p "$target_base"
  rm -rf "$tmp_dir"
  mkdir -p "$tmp_dir"

  (
    cd "$source_dir"
    tar --exclude='.DS_Store' --exclude='._*' -cf - .
  ) | (
    cd "$tmp_dir"
    tar -xf -
  )

  if [ -d "$dest_dir" ]; then
    backup_dir="${dest_dir}.backup.${timestamp}"
    mv "$dest_dir" "$backup_dir"
    printf 'Backed up existing %s to %s\n' "$dest_dir" "$backup_dir"
  fi

  mv "$tmp_dir" "$dest_dir"
  printf 'Installed %s -> %s\n' "$skill_name" "$dest_dir"
}

if [ "$REQUESTED_SKILL" = "all" ]; then
  SKILLS="$(list_skills)"
else
  skill_exists "$REQUESTED_SKILL" || fail "skill not found: $REQUESTED_SKILL"
  SKILLS="$REQUESTED_SKILL"
fi

TARGETS="$(resolve_targets)"

printf '%s\n' "$SKILLS" | while IFS= read -r skill_name; do
  [ -n "$skill_name" ] || continue
  printf '%s\n' "$TARGETS" | while IFS= read -r target_base; do
    [ -n "$target_base" ] || continue
    copy_skill "$skill_name" "$target_base"
  done
done

printf 'Done. Restart or reload your agent if newly installed skills do not appear immediately.\n'
