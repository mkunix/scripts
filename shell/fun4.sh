#!/bin/bash
#Passing parameters to Function

addmem() {

if [[ $# -eq 0 ]] || [[ $# -gt 2 ]]
then
	echo -1
elif [[ $# -eq  1 ]] 
then
	echo $[[ $1 + $1 ]]
else
	echo $[ $1 + $2 ]
fi
}

echo -n "Adding 10 and 15: "
echo
value=$(addmem 10 15)
echo -n $value
echo
echo -n "Let's try adding just one number"
value=


