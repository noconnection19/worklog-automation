#!/bin/sh
# ponytail: map Railway's PORT to N8N_PORT, then delegate to official entrypoint
export N8N_PORT="${PORT:-5678}"
export N8N_BLOCK_ENV_ACCESS_IN_NODE=false
exec /docker-entrypoint.sh "$@"
