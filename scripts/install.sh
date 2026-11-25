#!/bin/sh

force=0

usage() {
	printf 'Usage: %s [-f] [-h]\n' "$0" >&2
	printf '\nOption:\n' >&2
	printf '\t-f: force overwrite\n' >&2
	printf '\t-h: print this message\n' >&2
	exit 1
}

while getopts ':fh' opt; do
	case "${opt}" in
		f)
			force=1
			;;
		h)
			usage
			;;
		:)
			printf 'Error: -%s requires an argument.\n' "${OPTARG}" >&2
			usage
			;;
		\?)
			printf 'Error: invalid option -%s\n' "${OPTARG}" >&2
			usage
			;;
	esac
done
shift "$((OPTIND - 1))"

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

	if [ ! -f "${dstf}" ]; then
		cp "${src}" "${dstf}"
		echo "copied:  ${src} -> ${dstf}"
	elif [ "${force}" -eq "1" ]; then
		cp "${src}" "${dstf}"
		echo "copied:  ${src} -> ${dstf} (overwritten!)"
	else
		echo "skipped: ${src} -> ${dstf} (already exists)" # 1>&2
	fi

done

