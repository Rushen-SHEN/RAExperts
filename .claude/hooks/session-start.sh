#!/bin/bash
# Auto-install gstack skills and binaries on every Claude Code on the web
# session start. Local sessions (no $CLAUDE_CODE_REMOTE) are skipped so users
# developing on their own machine don't get setup re-runs.
set -euo pipefail

if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

cd "$CLAUDE_PROJECT_DIR"

# --no-prefix keeps skill names flat (/ship, /review, etc.) and skips the
# interactive prompt so the hook runs non-interactively.
./setup --no-prefix
