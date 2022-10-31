#!/usr/bin/env bash
env | egrep -v "^(#|;| |PATH|SHLVL|HOSTNAME|DOCKER_*)" | awk '$1 ~ /^\w+=/' | xargs -0 > docker-run-action.env

exec docker run --env-file docker-run-action.env --workdir "$INPUT_WORKSPACE" -v "/var/run/docker.sock":"/var/run/docker.sock" -v "$RUNNER_WORKSPACE":"/tmp/clickable"  --entrypoint=$INPUT_SHELL $INPUT_IMAGE -c "${INPUT_RUN//$'\n'/;}"
