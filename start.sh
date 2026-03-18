#!/bin/bash
bash /app/setup-composio-railway.sh
echo "=== STARTING NODE ==="
exec node /app/src/server.js
