#!/usr/bin/env zsh

if [[ -e PNPM-lock.yaml ]]
then
    echo "Please use PNPM with this project"
elif [[ -e yarn.lock ]]
then
    echo "Please use Yarn with this project"
else
    $NPM_PATH "$@"
fi