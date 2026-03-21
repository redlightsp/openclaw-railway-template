#!/bin/bash
set -euo pipefail

echo "🧪 Testing Composio connections..."

export COMPOSIO_API_KEY="${COMPOSIO_KEY}"
COMPOSIO_BIN="${HOME}/.composio/bin/composio"

echo ""
echo "Connected accounts:"
$COMPOSIO_BIN apps list-connections 2>/dev/null || echo "  (No connections yet — visit https://app.composio.dev/apps)"

echo ""
echo "Available tools for REIGN:"
echo "  • Gmail: Read/send emails, search, labels, drafts"
echo "  • Outlook: Read/send emails, search, folders"  
echo "  • Google Calendar: List/create/update events"
echo "  • Outlook Calendar: List/create/update events"

exit 0
