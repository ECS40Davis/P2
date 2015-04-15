#! /bin/bash

if [[ "$#" -ne 3 || ! -d "$1" || ! -d "$2" || -f "$3" ]]; then
  echo usage: cpdirs.sh source_directory1 source_directory2 dest_directory
else
  cp --preserve "$1"/* "$3" 2>/dev/null
  cp -u --preserve "$2"/* "$3" 2>/dev/null
fi
