#!/bin/bash
#Using a function in a script

func1 () {

    echo "This is an example of function"
}

count=1
while [[ $count -le 5 ]]
do
  func1
  count=$[ $count + 1 ]
done

echo 'This is the end of loop for function func1'
func1
echo "This is the end of script"
