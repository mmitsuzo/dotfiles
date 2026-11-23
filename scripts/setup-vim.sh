#!/bin/sh

# prepare Vim plugin manager
if [ ! -f ~/.vim/autoload/plug.vim ]; then
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# prepare SKK dictionary
if [ ! -f ~/.skk/SKK-JISYO.L ]; then
	mkdir -p ~/.skk && cd ~/.skk \
		&& curl -OL https://skk-dev.github.io/dict/SKK-JISYO.L.gz && gunzip SKK-JISYO.L.gz
#		&& wget https://skk-dev.github.io/dict/SKK-JISYO.L.gz && gunzip SKK-JISYO.L.gz
fi

## local bin setting
#result=$(grep -E "^# local bin setting" ~/.bashrc)
#if [ -z "$result" ]; then
#	echo '# local bin setting' >> ~/.bashrc
#	echo 'export PATH="${HOME}/.local/bin:${PATH}"' >> ~/.bashrc
#fi

