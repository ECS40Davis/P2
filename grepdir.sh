#! /bin/bash

if [[ $# -le 1 || ! -d $1 ]]; then
  echo 'usage: grepdir.sh directory pattern [-grep option]*'
else
  if [[ -z $3 ]]; then
    find #1 -exec grep $2 {} \; 2> /dev/null
  if [[ $3 && $3 != -* ]]; then
    echo 'usage: grepdir.sh directory pattern [-grep option]*'
  elif [[ $3 && $3 == -* ]]; then
    find #1 -exec grep $2 $3 {} \; 2> /dev/null
  elif [[ $4 && $4 != -* ]]; then
    echo 'usage: grepdir.sh directory pattern [-grep option]*'
  elif [[ $4 && $4 == -* ]]; then
    find #1 -exec grep $2 $3 $4 {} \; 2> /dev/null
  fi
fi
