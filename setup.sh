#!/usr/bin/env bash

export CVMFS_TMP_DIR=/tmp/cvmfs
export DEV_DIR=$PWD/dev
export USERID=`id -u`

mkdir -p ${CVMFS_TMP_DIR}
mkdir -p ${DEV_DIR}
