#!/bin/bash
bash /app/setup-composio-railway.sh

# Create Pixel agent if it doesn't exist
openclaw agents list | grep -q "pixel" || openclaw agents add pixel

echo "=== STARTING NODE ==="
exec node /app/src/server.js
