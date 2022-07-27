#!/usr/bin/env bash

firebase_dir=$($DOTFILES/config/starship/firebase/get_firebase_dir.sh)

function get_config_project_id() {
	if [[ -e ~/.config/configstore/firebase-tools.json ]]
	then
		# May be either the project id itself or an alias (which lives in .firebaserc)
		echo $(grep -s $firebase_dir ~/.config/configstore/firebase-tools.json | cut -d'"' -f 4)
	fi
}

function get_rc_project_id() {
	local rc_path=$firebase_dir/.firebaserc
	echo $(grep $1 $rc_path | cut -d'"' -f 4)
}

# Check the global firebase config file as priority
config_project_id=$(get_config_project_id)
if [[ -n $config_project_id ]]
then
    echo "$config_project_id"

# If nothing in the firebase config file, use the default value set in .firebaserc
else
    local firebaserc_project_id=$(get_rc_project_id "default")
    echo "$firebaserc_project_id"
fi