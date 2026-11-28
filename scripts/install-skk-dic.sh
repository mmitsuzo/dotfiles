#!/bin/sh

JISYODIR="${HOME}/.skk"
JISYOFILE="${JISYODIR}/SKK-JISYO.L"

if [ ! -f "${JISYOFILE}" ]; then
	curl -fLo "${JISYOFILE}.gz" --create-dirs \
		https://skk-dev.github.io/dict/SKK-JISYO.L.gz && \
		cd "${JISYODIR}" && gunzip "${JISYOFILE}.gz"
fi

