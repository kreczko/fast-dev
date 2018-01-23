#!/usr/bin/env bash
source setup.sh
docker-compose up -d cvmfs
# connect to container
docker exec -ti fastdev_cvmfs_1 cdw
