#!/usr/bin/env zsh

if [[ $1 != "npm" && $1 != "yarn" && $1 != "pnpm" ]]
then 
    echo "Please use valid node manager - npm,yarn,pnpm"
    exit 1
fi

if [[ -e PNPM-lock.yaml && $1 != "pnpm" ]]
then
    echo "Please use PNPM with this project"
    exit 1
fi

if [[ -e yarn.lock && $1 != "yarn" ]]
then
    echo "Please use Yarn with this project"
    exit 1
fi

if [[ -e package-lock.json && $1 != "npm" ]]
then
    echo "Please use npm with this project"
    exit 1
fi

$1 "${@[2,-1]}"