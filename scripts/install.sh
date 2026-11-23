#!/bin/sh

for src in $(git ls-files | grep '^dot\.')
do

	f=$(echo "${src}" | sed 's/^dot//')
	d=$(dirname "${f}")
	dstf="${HOME}/${f}"
	dstd="${HOME}/${d}"

	if [ ! -d "${dstd}" ]; then
		mkdir -p "${dstd}"
		echo "created: ${dstd}/"
	fi

	if [ -f "${dstf}" ]; then
		echo "skipped: ${src} -> ${dstf} (already exists)" # 1>&2
	else
		cp "${src}" "${dstf}"
		echo "copied:  ${src} -> ${dstf}"
	fi

done

