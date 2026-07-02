#!/bin/sh
# ponytail: map Railway's PORT to N8N_PORT, then delegate to official entrypoint
export N8N_PORT="${PORT:-5678}"
exec /docker-entrypoint.sh "$@"
