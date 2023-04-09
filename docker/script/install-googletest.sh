#!/bin/sh -e

GTEST_WORK_DIR=/home/user/.local/src
GTEST_PREFIX_DIR=/home/user/.local/gtest

# for temporary install test
#GTEST_WORK_DIR=/home/user/tmp-gtest/src
#GTEST_PREFIX_DIR=/home/user/tmp-gtest

if [ -d ${GTEST_WORK_DIR}/googletest ]; then
	echo "you already have googletest clone directory..."
	echo "src: ${GTEST_WORK_DIR}/googletest"
	exit 0
elif [ -d ${GTEST_PREFIX_DIR} ]; then
	echo "you already have googletest install directory..."
	echo "prefix: ${GTEST_PREFIX_DIR}"
	exit 0
fi

if [ ! -d ${GTEST_WORK_DIR} ]; then
	echo "mkdir -p ${GTEST_WORK_DIR}"
	mkdir -p ${GTEST_WORK_DIR}
fi

cd ${GTEST_WORK_DIR}
git clone https://github.com/google/googletest.git
cd googletest
mkdir build
cd build
cmake .. -DCMAKE_INSTALL_PREFIX=${GTEST_PREFIX_DIR} -DBUILD_GMOCK=OFF
make install

