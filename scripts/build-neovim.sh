#!/bin/sh
# vim: set sw=4 ts=4 sts=4 et :

export CC=clang
GITDIR=${HOME}/git-work
REMOTE='https://github.com/neovim/neovim.git'
LOCAL='neovim'
PREFIX=${HOME}/.local
PARANUM=8

mkdir -p ${GITDIR} && cd ${GITDIR}

if [ -d ${LOCAL} ]; then
	cd ${LOCAL} && git pull
else
	git clone ${REMOTE} && cd ${LOCAL}
fi

make CMAKE_BUILD_TYPE=RelWithDebInfo \
    CMAKE_INSTALL_PREFIX=${PREFIX} \
    -j ${PARANUM} \
    && make install

## Local bin setting
result=$(grep -E "^# Local bin setting" ~/.bashrc)
if [ -z "$result" ]; then
	echo '' >> ~/.bashrc
	echo '# Local bin setting' >> ~/.bashrc
	echo 'export PATH=${HOME}/.local/bin:${PATH}' >> ~/.bashrc
fi

