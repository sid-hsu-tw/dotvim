#!/usr/bin/env bash

if [ -z "$1" ]; then
  echo "usage: $0 FILE LINENO LINE"
  exit 1
fi

FILE=${1}

read -r -a INPUT <<< ${2}
CENTER=${INPUT[0]}

if [ ! -r "$FILE" ]; then
  echo "File not found ${FILE}"
  exit 1
fi

if [[ "$(file --dereference --mime "$FILE")" =~ binary ]]; then
  echo "$1 is a binary file"
  exit 0
fi

if [ -z "$CENTER" ]; then
  CENTER=0
fi

if [ -z "$LINES" ]; then
  if [ -r /dev/tty ]; then
    LINES=$(stty size < /dev/tty | awk '{print $1}')
  else
    LINES=40
  fi
fi

FIRST=$(($CENTER-$LINES/2))
FIRST=$(($FIRST < 1 ? 1 : $FIRST))

bat --style=changes,numbers --color=always -H ${CENTER} --line-range ${FIRST}: ${FILE}
