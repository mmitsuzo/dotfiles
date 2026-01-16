#!/bin/sh

sudo apt install unzip

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
	curl -fsSL https://deno.land/x/install/install.sh | sh \
		&& echo '' >> ~/.bashrc \
		&& echo '# DENO setting' >> ~/.bashrc \
		&& echo 'export DENO_INSTALL="/home/${USERNAME}/.deno"' >> ~/.bashrc \
		&& echo 'export PATH="$DENO_INSTALL/bin:$PATH"' >> ~/.bashrc
fi

## Node.js and aws-cdk install
result=$(grep -E "^# NODE setting" ~/.bashrc)
if [ -z "$result" ]; then
	curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash - && \
		sudo apt install nodejs && \
		&& echo '' >> ~/.bashrc \
		&& echo '# NODE setting' >> ~/.bashrc \
		&& echo 'export NPM_CONFIG_PREFIX=${HOME}/.node' >> ~/.bashrc \
		&& echo 'export PATH="${NPM_CONFIG_PREFIX}/bin:${PATH}"' >> ~/.bashrc \
		&& npm install -g aws-cdk typescript awk-language-server \
				  bash-language-server vscode-css-languageserver-bin \
				  typescript-language-server vim-language-server \
				  @google/gemini-cli
fi

## Gemini setting
result=$(grep -E "^# export NO_BROWSER" ~/.bashrc)
if [ -z "$result" ]; then
	echo '' >> ~/.bashrc
	echo 'export NO_BROWSER=true' >> ~/.bashrc
fi
