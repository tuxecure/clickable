#!/usr/bin/env bash
ls
pwd
set -x
exec docker run --workdir "/tmp/clickable_base" -v "/var/run/docker.sock":"/var/run/docker.sock" -v "$RUNNER_WORKSPACE":"/tmp/clickable_base"  --entrypoint=sh $INPUT_IMAGE -c "${INPUT_RUN//$'\n'/;}"
