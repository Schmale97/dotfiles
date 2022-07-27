#!/usr/bin/env bash

dir="$(pwd)"
# Keep checking up, we may be in a subdir
while [[ $dir != '/' ]]
do
	target="$dir/firebase.json"

	if [[ -e $target ]]
	then
			echo $dir
			break
	else
			dir=$(dirname ${dir:A})
	fi
done