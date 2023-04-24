#!/bin/sh -e

WORK_DIR=${HOME}/.local/src
PREFIX_DIR=${HOME}/.local
#PREFIX_DIR=${HOME}/.local/go

# for temporary test
#WORK_DIR=${HOME}/tmp-go/src
#PREFIX_DIR=${HOME}/tmp-go

mkdir -p ${WORK_DIR} && \
cd ${WORK_DIR} && \
wget https://go.dev/dl/go1.20.3.linux-amd64.tar.gz && \
tar -C ${PREFIX_DIR} -xf go1.20.3.linux-amd64.tar.gz

