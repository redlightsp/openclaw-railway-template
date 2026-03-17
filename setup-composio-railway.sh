#!/bin/bash
set -euo pipefail

COMPOSIO_KEY="${COMPOSIO_KEY:-}"
if [ -z "$COMPOSIO_KEY" ]; then
  echo "WARNING: COMPOSIO_KEY is not set — skipping Composio setup." >&2
  exit 0
fi

echo "Starting Composio setup..."

# Authenticate Composio CLI with your API key
composio login --api-key "$COMPOSIO_KEY"

# Verify connection
composio whoami && echo "Composio authenticated successfully." || echo "WARNING: Composio auth check failed."

echo "Done. Now connect Gmail/Google Calendar at https://app.composio.dev"
exit 0
