#!/bin/sh

if [ ! -f "${HOME}/.config/vim/autoload/plug.vim" ]; then
	curl -fLo "${HOME}/.config/vim/autoload/plug.vim" --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

