#!/usr/bin/env bash
# finesse — mirror sync.
#
# `skills/finesse-ui/` is the single source of truth. Every other copy in this
# repo is a derived artifact for a different host:
#
#   .trae/skills/finesse-ui/       verbatim copy
#   .trae-cn/skills/finesse-ui/    verbatim copy
#   .codebuddy/skills/finesse-ui/  verbatim copy
#   .cursor/rules/finesse-ui.mdc   SKILL.md body + Cursor's own frontmatter
#
# Hand-maintaining four copies fails silently: .codebuddy sat two versions
# behind (0.12.0 vs 0.13.0, missing two reference files) because a release
# touched the source and three of the four mirrors. Hence this script.
#
# Usage:
#   bash scripts/sync-mirrors.sh            # write the mirrors
#   bash scripts/sync-mirrors.sh --check    # report drift, change nothing (exit 1 on drift)

set -euo pipefail
cd "$(dirname "$0")/.."

SRC="skills/finesse-ui"
MIRRORS=(".trae/skills/finesse-ui" ".trae-cn/skills/finesse-ui" ".codebuddy/skills/finesse-ui")
MDC=".cursor/rules/finesse-ui.mdc"
CHECK=0
[[ "${1:-}" == "--check" ]] && CHECK=1

[[ -d "$SRC" ]] || { echo "✗ source missing: $SRC"; exit 1; }

RSYNC_OPTS=(-a --delete --exclude '.DS_Store')
drift=0

# --- verbatim mirrors -------------------------------------------------------
for m in "${MIRRORS[@]}"; do
  if [[ $CHECK -eq 1 ]]; then
    out=$(rsync "${RSYNC_OPTS[@]}" --dry-run --itemize-changes "$SRC/" "$m/" 2>/dev/null || true)
    if [[ -n "$out" ]]; then
      echo "✗ drift: $m"
      echo "$out" | sed 's/^/    /' | head -20
      drift=1
    else
      echo "✓ $m"
    fi
  else
    mkdir -p "$m"
    rsync "${RSYNC_OPTS[@]}" "$SRC/" "$m/"
    echo "✓ synced $m"
  fi
done

# --- Cursor .mdc: source body + the mdc's own frontmatter -------------------
# The .mdc carries Cursor-specific frontmatter (description / globs /
# alwaysApply) that is NOT in SKILL.md, so it is preserved verbatim and only
# the body below it is replaced.
build_mdc() {
  # existing frontmatter (first --- … --- block), then SKILL.md minus its own
  awk 'NR==1&&/^---$/{f=1;print;next} f&&/^---$/{print;exit} f{print}' "$MDC"
  echo
  awk 'NR==1&&/^---$/{f=1;next} f&&/^---$/{f=0;next} !f' "$SRC/SKILL.md"
}

if [[ -f "$MDC" ]]; then
  tmp=$(mktemp)
  build_mdc > "$tmp"
  if [[ $CHECK -eq 1 ]]; then
    if ! diff -q "$MDC" "$tmp" >/dev/null; then
      echo "✗ drift: $MDC ($(diff "$MDC" "$tmp" | grep -c '^[<>]') changed lines)"
      drift=1
    else
      echo "✓ $MDC"
    fi
  else
    mv "$tmp" "$MDC"
    echo "✓ rebuilt $MDC"
  fi
  rm -f "$tmp"
else
  echo "?? $MDC not found — skipped"
fi

# --- version coherence ------------------------------------------------------
# The plugin manifest carries the version independently of SKILL.md frontmatter;
# they drift apart exactly as easily as the mirrors do.
SKILL_V=$(awk -F'"?version:"? *' '/^version:/{print $2; exit}' "$SRC/SKILL.md" | tr -d '"'"'"' ')
PLUGIN_V=$(grep -o '"version"[^,]*' .claude-plugin/plugin.json 2>/dev/null | head -1 | grep -o '[0-9][^"]*' || echo "?")
if [[ "$SKILL_V" != "$PLUGIN_V" ]]; then
  echo "✗ version drift: SKILL.md=$SKILL_V  plugin.json=$PLUGIN_V"
  drift=1
else
  echo "✓ version $SKILL_V (SKILL.md == plugin.json)"
fi

if [[ $CHECK -eq 1 ]]; then
  [[ $drift -eq 0 ]] && echo "✓ all mirrors in sync" || echo "✗ mirrors have drifted — run: bash scripts/sync-mirrors.sh"
  exit $drift
fi
echo "✓ done"
