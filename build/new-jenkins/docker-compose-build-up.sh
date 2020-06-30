#!/bin/bash

set -o errexit -o errtrace -o nounset -o pipefail -o xtrace

docker-compose build

seq 0 $((${DOCKER_PROCESSES:-1} - 1)) | parallel --line-buffer "docker-compose --project-name canvas-lms{} up -d"
