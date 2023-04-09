#!/bin/sh -e

WORK_DIR=${HOME}/.local/src
#PREFIX_DIR=${HOME}/.local
PREFIX_DIR=${HOME}/.local/cpputest

# for temporary test
#WORK_DIR=${HOME}/tmp-cpputest/src
#PREFIX_DIR=${HOME}/tmp-cpputest

mkdir -p ${WORK_DIR}
cd ${WORK_DIR}
git clone https://github.com/cpputest/cpputest.git
cd cpputest/build
autoreconf .. -i
../configure --prefix=${PREFIX_DIR}
make
make install


