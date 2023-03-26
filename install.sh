#!/bin/sh

workdir=$(dirname $0)
for df in $(ls ${workdir} | grep ^dot)
do

	dstpath=$(echo $df | sed -e 's/^dot//')
	echo "execute: cp -rT ${workdir}/${df} ~/${dstpath}"
	cp -rT ${workdir}/${df} ~/${dstpath}

#	if [ -d ~/${dstpath} ]
#	then
#		echo "override directory: cp -rf ${workdir}/${df}/* ~/${dstpath}/"
#		cp -rf ${workdir}/${df}/* ~/${dstpath}/
#	elif [ -f ~/${dstpath} ]
#	then
#		echo "override file: cp -f ${workdir}/${df} ~/${dstpath}"
#		cp -f ${workdir}/${df} ~/${dstpath}
#	elif [ -d ${workdir}/${df} ]
#	then
#		echo "copy directory: cp -r ${workdir}/${df} ~/${dstpath}"
#		cp -r ${workdir}/${df} ~/${dstpath}
#	else
#		echo "copy file: cp ${workdir}/${df} ~/${dstpath}"
#		cp ${workdir}/${df} ~/${dstpath}
#	fi

done

