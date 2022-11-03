#!/usr/bin/env bash
env | egrep -v "^(#|;| |PATH|SHLVL|HOSTNAME|DOCKER_*)" | awk '$1 ~ /^\w+=/' | xargs -0 > docker-run-action.env
set -x
env | egrep -v "(RUNNER_*|GITHUB_*)" | awk '$1 ~ /^\w+=/' | xargs -0
ls /github
exec docker run --env-file docker-run-action.env --workdir "$RUNNER_WORKSPACE/$INPUT_WORKSPACE" -v "/var/run/docker.sock":"/var/run/docker.sock" -v "/github/home":"/github/home" -v "/github/workflow":"/github/workflow" -v "/github/file_commands":"/github/file_commands" -v "$RUNNER_WORKSPACE":"$RUNNER_WORKSPACE" --entrypoint=$INPUT_SHELL $INPUT_IMAGE -c "${INPUT_RUN//$'\n'/;}"
