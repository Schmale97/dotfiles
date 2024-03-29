#!/usr/bin/env zsh

confirm_input () {
    LIMIT=10
    ITERABLE=1

    until [[ $ITERABLE -gt $LIMIT ]];
    do
        [[ $ITERABLE -eq 1 ]] && ATTEMPT="" || ATTEMPT="[$ITERABLE/$LIMIT] - "
        read -t 10 "CONFIRM?$ATTEMPT$1 (Y/N)? "
        if [[ $CONFIRM == [yY] || $CONFIRM == [yY][eE][sS] ]];
        then
            return 0;
        fi
        if [[ $CONFIRM == [nN] || $CONFIRM == [nN][oO] || -z $CONFIRM ]];
        then
            return 1;
        fi
        ITERABLE=$((ITERABLE+1))
    done
    return 1;
}

CONFIG_FILE=$1
EDIT_FILE="CREATE"
if [[ -f ~/$CONFIG_FILE ]];
then
    echo $CONFIG_FILE already exists
    confirm_input "Would you like to overwrite?" && EDIT_FILE="UPDATE" || EDIT_FILE="NO"
fi

if [[ $EDIT_FILE = "NO" ]]
then
    echo Leaving $CONFIG_FILE unchanged.
    exit 0
fi
if [[ $EDIT_FILE = "CREATE" ]]
then
    echo Creating $CONFIG_FILE...
fi
if [[ $EDIT_FILE = "UPDATE" ]]
then
    echo Updating $CONFIG_FILE...
fi

LIMIT=10
ITERABLE=1
until [[ $ITERABLE -gt $LIMIT ]];
do
    read "EMAIL?Please enter your work email address: "
    confirm_input "Is this email correct?" && break || true
    ITERABLE=$((ITERABLE+1))
done

touch ~/$CONFIG_FILE
cat $(dirname $0)/custom_email.txt > ~/$CONFIG_FILE 

sed -i '' "s/<<Email>>/$EMAIL/g" ~/$CONFIG_FILE

if [[ $EDIT_FILE = "CREATE" ]]
then
    echo Created $CONFIG_FILE.
fi
if [[ $EDIT_FILE = "UPDATE" ]]
then
    echo Updated $CONFIG_FILE.
fi