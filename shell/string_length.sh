#!/bin/bash
#
length=0

string_length() {
  length=$(echo $1|wc -m)
  echo "$length"
}

read -p "Enter the String: " USER_STRING

string_length $USER_STRING
