#!/bin/bash
set -euo pipefail

COMPOSIO_KEY="${COMPOSIO_KEY:-}"
if [ -z "$COMPOSIO_KEY" ]; then
  echo "WARNING: COMPOSIO_KEY is not set — skipping Composio setup." >&2
  exit 0
fi

echo "Starting Composio setup..."
export COMPOSIO_API_KEY="$COMPOSIO_KEY"
echo "Composio API key set successfully."
echo "Done."
exit 0
