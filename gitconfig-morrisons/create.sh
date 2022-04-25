#!/usr/bin/env bash

confirm_input () {
    LIMIT=10
    ITERABLE=1

    until [[ $ITERABLE -gt $LIMIT ]];
    do
        [[ $ITERABLE -eq 1 ]] && ATTEMPT="" || ATTEMPT="[$ITERABLE/$LIMIT] - "
        read -p "$ATTEMPT$1 (Y/N): " CONFIRM
        if [[ $CONFIRM == [yY] || $CONFIRM == [yY][eE][sS] ]];
        then
            return 0;
        fi
        if [[ $CONFIRM == [nN] || $CONFIRM == [nN][oO] ]];
        then
            return 1;
        fi
        ITERABLE=$((ITERABLE+1))
    done
    return 1;
}

EDIT_FILE="CREATE"
if [[ -f ~/.gitconfig-morrisons ]];
then
    echo .gitconfig-morrisons already exists
    confirm_input "Would you like to overwrite?" && EDIT_FILE="UPDATE" || EDIT_FILE="NO"
fi

if [[ EDIT_FILE = "NO" ]]
then
    echo leaving .gitconfig-morrisons unchanged
    exit 0
fi
if [[ EDIT_FILE = "CREATE" ]]
then
    echo creating .gitconfig-morrisons
fi
if [[ EDIT_FILE = "UPDATE" ]]
then
    echo updating .gitconfig-morrisons
fi

LIMIT=10
ITERABLE=1
until [[ $ITERABLE -gt $LIMIT ]];
do
    read -p "Please enter your morrisons email address: " EMAIL
    confirm_input "Is this email correct?" && break || true
    ITERABLE=$((ITERABLE+1))
done
touch ~/.gitconfig-morrisons
cat ./gitconfig-morrisons/template > ~/.gitconfig-morrisons 
sed -i "s/:::EMAIL:::/$EMAIL/g" ~/.gitconfig-morrisons 