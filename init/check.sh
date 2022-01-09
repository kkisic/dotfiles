#!/bin/bash

TARGET=(
    "ag"
    "asdf"
    "deno"
    "direnv"
    "docker"
    "ghq"
    "go"
    "jq"
    "node"
    "nvim"
    "peco"
    "python"
    "python3"
    "tig"
    "tmux"
    "tree"
    "yq"
)

for t in ${TARGET[@]}; do
    if !(type ${t} > /dev/null 2>&1); then
        echo "${t} is not installed"
    fi
done

# TODO
# rust
