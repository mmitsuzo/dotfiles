#!/bin/sh

## DENO install
result=$(grep -E "^# DENO setting" ~/.bashrc)
if [ -z "$result" ]; then
	curl -fsSL https://deno.land/x/install/install.sh | sh -s -- -y --no-modify-path \
		&& echo '' >> ~/.bashrc \
		&& echo '# DENO setting' >> ~/.bashrc \
		&& echo 'export DENO_INSTALL="${HOME}/.deno"' >> ~/.bashrc \
		&& echo 'export PATH="${DENO_INSTALL}/bin:${PATH}"' >> ~/.bashrc
fi

