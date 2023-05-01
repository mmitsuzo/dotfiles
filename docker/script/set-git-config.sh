#!/bin/sh

# email/name need to be specified
user_email=""
user_name=""
core_editor="vim"
diff_tool="vimdiff"
merge_tool="vimdiff"
scope="--local"

if [ x"$1" = x"global" ]; then
	scope="--global"
fi

git config ${scope} user.email "${user_email}"
git config ${scope} user.name "${user_name}"
git config ${scope} core.editor "${core_editor}"
git config ${scope} diff.tool "${diff_tool}"
git config ${scope} merge.tool "${merge_tool}"
git config --list

