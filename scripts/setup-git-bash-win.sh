# should be read from current shell (use . or source)

if echo "$0" | grep -q "setup-git-bash.sh"
then
	echo "should to be called from source or .(dot) command."
	echo "aborted."
elif [ "$1" = "off" ]
then
	echo "unset MSYS_NO_PATHCONV"
	unset MSYS_NO_PATHCONV

	echo "git config --global --unset core.quotepath"
	git config --global --unset core.quotepath
else
	echo "export MSYS_NO_PATHCONV=1"
	export MSYS_NO_PATHCONV=1

	echo "git config --global core.quotepath false"
	git config --global core.quotepath false
fi

