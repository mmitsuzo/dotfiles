#!/bin/sh

workdir=$(dirname $0)
for df in $(ls ${workdir} | grep ^dot)
do

	dstpath=$(echo $df | sed -e 's/^dot//')
	echo "execute: cp -rT ${workdir}/${df} ~/${dstpath}"
	cp -rT ${workdir}/${df} ~/${dstpath}

done

