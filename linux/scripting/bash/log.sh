#!/usr/bin/env bash

log() {
    echo $(date -u +"%Y-%m-%dT%H:%M:%SZ") "${@}"
}

log "test"
log "test1"
sleep 10
log "test2"
