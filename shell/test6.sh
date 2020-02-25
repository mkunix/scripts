#!/bin/bash
#trying to access script parameters inside a function

function badfunction1() {
  echo $[ $1 * $2 ]
}

if [ $# -eq 2 ]
then
  value=$(badfunction1 $1 $2)
  echo "The value is ${value}"
else
  echo "Usage: test6.sh a b"
fi
