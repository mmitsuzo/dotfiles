#!/bin/sh

mkdir -p ~/git-work && cd ~/git-work

if [ -d vim ]; then
	cd vim \
		&& git pull
else
	git clone https://github.com/vim/vim.git \
		&& cd vim
fi

export CC=clang
./configure --prefix=${HOME}/.local \
	&& make -j 8 \
	&& make install

# vim: set sw=4 ts=4 sts=4 et :
