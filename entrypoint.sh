#!/usr/bin/env bash
env | egrep -v "^(INPUT_*|GITHUB_*|ACTIONS_*|RUNNER_*|HOME|CI)" | awk '$1 ~ /^\w+=/' | xargs -0

exec docker run --workdir "$INPUT_WORKSPACE" -v "/var/run/docker.sock":"/var/run/docker.sock" -v "$RUNNER_WORKSPACE":"/tmp/clickable_base"  --entrypoint=$INPUT_SHELL $INPUT_IMAGE -c "${INPUT_RUN//$'\n'/;}"
