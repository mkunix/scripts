#/bin/bash
#Use return command in function to double the value

double(){
  read -p "Enter a Value to double: " value
  echo $[ value * 2 ]
}

result=$(double)
echo "The doubled value is ${result} "
