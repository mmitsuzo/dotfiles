#!/bin/sh

# install Ubuntu packages
sudo apt update
sudo apt install -y \
	bzip2 bzip2-doc zip unzip \
       	tmux xsel \
	gawk gawk-doc \
	ninja-build gettext \
	make make-doc \
	cmake cmake-doc \
	autoconf autoconf-doc automake \
        libtool libtool-bin libtool-doc \
	clang libxt-dev \
        m4 m4-doc \
	python3 python3-doc python3-venv \
	clangd python3-pylsp gopls \
	ripgrep fd-find fzf

# prepare Vim plugin manager
if [ ! -f ~/.vim/autoload/plug.vim ]; then
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# prepare SKK dictionary
if [ ! -f ~/.skk/SKK-JISYO.L ]; then
	mkdir -p ~/.skk && cd ~/.skk \
		&& wget https://skk-dev.github.io/dict/SKK-JISYO.L.gz && gunzip SKK-JISYO.L.gz
fi

# Gemini setting
result=$(grep -E "^# Gemini setting" ~/.bashrc)
if [ -z "$result" ]; then
	echo '' >> ~/.bashrc
	echo '# Gemini setting' >> ~/.bashrc
	echo 'export NO_BROWSER=true' >> ~/.bashrc
fi

