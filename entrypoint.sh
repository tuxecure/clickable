#!/usr/bin/env bash
exec docker run --workdir "$INPUT_WORKSPACE" -v "/var/run/docker.sock":"/var/run/docker.sock" -v "$RUNNER_WORKSPACE":"/tmp/clickable_base"  --entrypoint=sh $INPUT_IMAGE -c "${INPUT_RUN//$'\n'/;}"
