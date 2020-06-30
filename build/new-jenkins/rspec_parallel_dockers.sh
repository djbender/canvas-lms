#!/bin/bash

set -o nounset -o errexit -o errtrace -o pipefail -o xtrace

# Run each group of tests in separate docker container
seq 0 $((${DOCKER_PROCESSES:-1} - 1)) | parallel --line-buffer "docker-compose --project-name canvas-lms{} exec -T -e TEST_PROCESS={} canvas bash -c 'build/new-jenkins/rspec-with-retries.sh'"
