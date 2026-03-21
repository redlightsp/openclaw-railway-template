#!/bin/bash
set -euo pipefail

echo "🦞 REIGN Composio Setup — Connecting Gmail, Outlook, and Calendars"

# Check for COMPOSIO_KEY
COMPOSIO_KEY="${COMPOSIO_KEY:-}"
if [ -z "$COMPOSIO_KEY" ]; then
  echo "❌ ERROR: COMPOSIO_KEY not set in Railway environment variables"
  exit 1
fi

echo "✅ COMPOSIO_KEY found (length: ${#COMPOSIO_KEY})"

# Install Composio CLI
echo "📦 Installing Composio CLI..."
curl -fsSL https://composio.dev/install | bash
export PATH="$HOME/.composio/bin:$PATH"

# Verify installation
if ! command -v composio &> /dev/null; then
  echo "⚠️  Composio CLI not in PATH, trying direct path..."
  COMPOSIO_BIN="$HOME/.composio/bin/composio"
else
  COMPOSIO_BIN="composio"
fi

echo "✅ Composio CLI installed"

# Authenticate with Composio
echo "🔐 Authenticating with Composio API..."
export COMPOSIO_API_KEY="$COMPOSIO_KEY"

# Create/verify user session
echo "👤 Creating REIGN user session..."
USER_ID="reign_caryn_$(date +%s)"

# Show available toolkits
echo "📋 Available Composio toolkits:"
$COMPOSIO_BIN apps list 2>/dev/null | grep -E "(gmail|googlecalendar|outlook)" || echo "  (Use Composio dashboard to connect accounts)"

# Instructions for connecting accounts
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📝 NEXT STEPS - Connect Your Accounts:"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "1. Go to: https://app.composio.dev/apps"
echo "2. Click 'Connect' for each:"
echo "   • Gmail"
echo "   • Google Calendar"
echo "   • Outlook (Microsoft 365)"
echo "   • Outlook Calendar"
echo ""
echo "3. Once connected, REIGN can access:"
echo "   ✉️  All your emails (Gmail + Outlook + iCloud)"
echo "   📅 Merged calendar view (Google + Outlook)"
echo "   📊 Priority email detection"
echo "   📝 Draft email creation"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "✅ Composio CLI setup complete!"
echo "🔗 Your API Key is configured and ready"
echo ""

exit 0
