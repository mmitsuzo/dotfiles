#!/bin/sh

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

if [ ! -f ~/.vim/autoload/plug.vim ]; then
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

if [ ! -f ~/.skk/SKK-JISYO.L ]; then
	mkdir -p ~/.skk && cd ~/.skk \
		&& wget https://skk-dev.github.io/dict/SKK-JISYO.L.gz && gunzip SKK-JISYO.L.gz
fi

result=$(grep -E "^# DENO setting" ~/.bashrc)
if [ -z "$result" ]; then
	curl -fsSL https://deno.land/x/install/install.sh | DEBIAN_FRONTEND=noninteractive sh \
		&& echo '' >> ~/.bashrc \
		&& echo '# DENO setting' >> ~/.bashrc \
		&& echo 'export DENO_INSTALL="${HOME}/.deno"' >> ~/.bashrc \
		&& echo 'export PATH="${DENO_INSTALL}/bin:${PATH}"' >> ~/.bashrc
fi

## Node.js and aws-cdk install
result=$(grep -E "^# NODE setting" ~/.bashrc)
if [ -z "$result" ]; then
	curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash - \
		&& DEBIAN_FRONTEND=noninteractive sudo apt install nodejs \
		&& echo '' >> ~/.bashrc \
		&& echo '# NODE setting' >> ~/.bashrc \
		&& echo 'export NPM_CONFIG_PREFIX=${HOME}/.node' >> ~/.bashrc \
		&& echo 'export PATH="${NPM_CONFIG_PREFIX}/bin:${PATH}"' >> ~/.bashrc \
		&& export NPM_CONFIG_PREFIX=${HOME}/.node \
		&& npm install -g aws-cdk typescript awk-language-server \
				  bash-language-server vscode-css-languageserver-bin \
				  typescript-language-server vim-language-server \
				  @google/gemini-cli
fi

## Gemini setting
result=$(grep -E "^# Gemini setting" ~/.bashrc)
if [ -z "$result" ]; then
	echo '' >> ~/.bashrc
	echo '# Gemini setting' >> ~/.bashrc
	echo 'export NO_BROWSER=true' >> ~/.bashrc
fi
