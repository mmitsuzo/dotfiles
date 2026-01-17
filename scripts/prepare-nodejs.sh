#!/bin/sh

## Node.js and aws-cdk install
result=$(grep -E "^# NODE setting" ~/.bashrc)
if [ -z "$result" ]; then

	curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash - \
		&& sudo apt install -y nodejs

	echo '' >> ~/.bashrc
	echo '# NODE setting' >> ~/.bashrc
	echo 'export NPM_CONFIG_PREFIX=${HOME}/.node' >> ~/.bashrc
	echo 'export PATH=${PATH}:${NPM_CONFIG_PREFIX}/bin'   >> ~/.bashrc
	export NPM_CONFIG_PREFIX=${HOME}/.node

	CC=clang CXX=clang++ npm install -g --verbose \
		aws-cdk \
		typescript \
		awk-language-server \
		bash-language-server \
		vscode-css-languageserver-bin \
		typescript-language-server \
		vim-language-server \
		@google/gemini-cli

fi

