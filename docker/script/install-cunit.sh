#!/bin/sh -e

# ref: https://askubuntu.com/questions/1087069/cunit-installation-problem
# ref: https://askubuntu.com/a/27679/940185
#
#libtoolize --force
#aclocal
#autoheader
#automake --force-missing --add-missing
#autoconf
#./configure --prefix=~/.local/cunit
#make
#make install
#
# [latest git source]
# git clone https://gitlab.com/cunity/cunit.git

WORK_DIR=${HOME}/.local/src
#PREFIX_DIR=${HOME}/.local
PREFIX_DIR=${HOME}/.local/cunit

# for temporary test
#WORK_DIR=${HOME}/tmp-cunit/src
#PREFIX_DIR=${HOME}/tmp-cunit

mkdir -p ${WORK_DIR}
cd ${WORK_DIR}
git clone https://gitlab.com/cunity/cunit.git
cd cunit
mkdir -p local-build
cd local-build
cmake .. -DCMAKE_INSTALL_PREFIX=${PREFIX_DIR}
cmake --build .
cmake --install .

