#!/bin/sh
echo "=== WORKLOG STARTUP SCRIPT ==="
echo "PORT=$PORT"
echo "N8N_PORT=$N8N_PORT"
echo "Node: $(node --version)"
echo "n8n path: $(which n8n)"
echo "Running: n8n (no args)"
echo "=============================="
export N8N_PORT="${PORT:-5678}"
exec n8n
