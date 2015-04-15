#! /bin/bash

if [ $# -lt 1 ]; then
  echo 'Executable name required.'
  echo 'usage: makemake.sh executable_name'
else 

  # Line 1
  echo -n "$1 :">Makefile
  for f in *.cpp; do
    filename=${f%cpp}o
    echo -n " $filename">>Makefile
  done
  echo -n -e "\n">>Makefile

  # Line 2
  if [[ "$#" == 3 ]]
  then
    echo -e -n '\tg++ -ansi -Wall -g -o '"$1" "$2" "$3">>Makefile
  elif [[ "$#" == 1 ]]
    then
      echo -e -n '\tg++ -ansi -Wall -g -o '"$1">>Makefile 
  fi
  for f in *.cpp; do
    filename=${f%cpp}o
    echo -n " $filename">>Makefile
  done
  echo -n -e "\n\n">>Makefile

  # Line 3+
  for f in *.cpp; do
    filename=${f%cpp}o
    echo -n "$filename : $f ">>Makefile
    grep -e '#include'" *"'"' $f | sed 's/#include "//g' | sed 's/"//g' | tr '\r\n' ' '>>Makefile
    echo -n -e "\n">>Makefile

    # Line 4+
    if [[ "$#" == 3 ]]
    then
      echo -e -n '\tg++ -ansi -Wall -g -c ' "$2" "$3" "$f">>Makefile
    elif [[ "$#" == 1 ]]
      then
        echo -e -n '\tg++ -ansi -Wall -g -c '"$f">>Makefile 
    fi
    echo -n -e "\n\n">>Makefile
  done

  # Line Clean
  echo "clean :">>Makefile
  echo -n -e "\trm -f $1">>Makefile
    for f in *.cpp; do
    filename=${f%cpp}o
    echo -n " $filename">>Makefile
  done
fi 
