#!/usr/bin/env bash
env | egrep -v "^(#|;| |PATH|SHLVL|HOSTNAME|DOCKER_*)" | awk '$1 ~ /^\w+=/' | xargs -0 > docker-run-action.env
set -x
env | egrep "(RUNNER_*|GITHUB_*)" | awk '$1 ~ /^\w+=/' | xargs -0
ls /github
exec docker run --env-file docker-run-action.env --workdir "$RUNNER_WORKSPACE/$INPUT_WORKSPACE" -v "/var/run/docker.sock":"/var/run/docker.sock" -v "$HOME":"$HOME" -v "/github/workflow":"/github/workflow" -v "/github/file_commands":"/github/file_commands" -v "$GITHUB_WORKSPACE":"$GITHUB_WORKSPACE" -v "$GITHUB_PATH":"$GITHUB_PATH" -v "$RUNNER_TEMP":"$RUNNER_TEMP" -v "$GITHUB_STATE":"$GITHUB_STATE" -v "$GITHUB_ENV":"$GITHUB_ENV" -v "$GITHUB_EVENT_PATH":"$GITHUB_EVENT_PATH" -v "$GITHUB_STEP_SUMMARY":"$GITHUB_STEP_SUMMARY" -v "$RUNNER_TOOL_CACHE":"$RUNNER_TOOL_CACHE" -v "$RUNNER_WORKSPACE":"$RUNNER_WORKSPACE" -v "$GITHUB_OUTPUT":"$GITHUB_OUTPUT" --entrypoint=$INPUT_SHELL $INPUT_IMAGE -c "${INPUT_RUN//$'\n'/;}"
