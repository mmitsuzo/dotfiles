#!/bin/sh -e

WORK_DIR=${HOME}/.local/src
#PREFIX_DIR=${HOME}/.local
PREFIX_DIR=${HOME}/.local/unity

# for temporary test
#WORK_DIR=${HOME}/tmp-unity/src
#PREFIX_DIR=${HOME}/tmp-unity/unity

mkdir -p ${WORK_DIR}
cd ${WORK_DIR}
git clone https://github.com/ThrowTheSwitch/Unity.git
cd Unity
mkdir -p local-build
cd local-build
cmake .. -DCMAKE_INSTALL_PREFIX=${PREFIX_DIR}
make
make install

