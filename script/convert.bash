#!/bin/bash

# Convert all submodules to real repositories
convert_all() {
  local gitroot=$(git rev-parse --show-cdup)
  cd ${gitroot:-$PWD}
  git submodule | while read line; do
    local commit=$(echo $line | awk '{print $1}')
    local module=$(echo $line | awk '{print $2}')
    local path=$(git config -f .gitmodules submodule.$module.path)
    local url=$(git config -f .gitmodules submodule.$module.url)
    if [[ -f ./$path/.git ]] || [ ! -d ./$path ]; then
      echo convert: $module
      rm -rf ./$path
      git clone $url $path
    fi
  done
}

convert_all
