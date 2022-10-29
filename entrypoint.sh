#!/usr/bin/env bash
exec docker run -v "/var/run/docker.sock":"/var/run/docker.sock" -v $INPUT_WORKSPACE  --network $INPUT_NETWORK --entrypoint=sh $INPUT_IMAGE -c "${INPUT_RUN//$'\n'/;}"
