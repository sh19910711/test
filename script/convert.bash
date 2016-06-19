#!/bin/bash

# Convert all submodules to real repositories
convert_all() {
  local gitroot=$(git rev-parse --show-cdup)
  cd ${gitroot:-$PWD}

  git submodule | while read line; do
    local commit_id=$(echo $line | awk '{print $1}')
    local module=$(echo $line | awk '{print $2}')
    local path=$(git config -f .gitmodules submodule.$module.path)
    local url=$(git config -f .gitmodules submodule.$module.url)

    if [[ -f ./$path/.git ]] || [[ ! -e ./$path/.git ]]; then
      echo convert: $module
      rm -rf ./$path
      git clone $url $path

      pushd $path
      git checkout -b some_commit ${commit_id:1:-1}
      popd
    fi
  done
}

convert_all
