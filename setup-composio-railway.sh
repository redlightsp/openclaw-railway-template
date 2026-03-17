#!/bin/bash
set -euo pipefail

COMPOSIO_KEY="${COMPOSIO_KEY:-}"
if [ -z "$COMPOSIO_KEY" ]; then
  echo "WARNING: COMPOSIO_KEY is not set — skipping Composio setup." >&2
  exit 0
fi

echo "Starting Composio setup..."

# Set API key as environment variable (no interactive login needed)
export COMPOSIO_API_KEY="$COMPOSIO_KEY"

# Verify Composio is installed and accessible
composio whoami && echo "Composio authenticated successfully." || echo "WARNING: Composio auth check failed."

echo "Done. Connect Gmail/Google Calendar at https://app.composio.dev"
exit 0
