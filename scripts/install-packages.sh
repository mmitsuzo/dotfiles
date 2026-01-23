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

