#!/usr/bin/env bash
ls
pwd
set -x
exec docker run -v "/var/run/docker.sock":"/var/run/docker.sock" -v $INPUT_WORKSPACE:"/tmp/clickable_base"  --entrypoint=sh $INPUT_IMAGE -c "${INPUT_RUN//$'\n'/;}"
