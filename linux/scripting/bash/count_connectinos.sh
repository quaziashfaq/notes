#!/usr/bin/env bsah

function log() {
    echo $(date -u +"%Y-%m-%dT%H:%M:%SZ") "$@"
}

while [[ true ]]; do
    log "Number of open connections: " $(netstat -tlnp | wc -l)
    sleep 30
done
