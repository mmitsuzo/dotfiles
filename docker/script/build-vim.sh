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

## Local bin setting
result=$(grep -E "^# Local bin setting" ~/.bashrc)
if [ -z "$result" ]; then
	echo '' >> ~/.bashrc
	echo '# Local bin setting' >> ~/.bashrc
	echo 'export PATH=${HOME}/.local/bin:${PATH}' >> ~/.bashrc
fi

# vim: set sw=4 ts=4 sts=4 et :
