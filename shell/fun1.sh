#!/usr/bin/env bash
#
#Define the function

log_msg() {
  echo "[[[ `date '+ %F %N'` ]]]: $@"
}

read -p "Enter the logger message: " msg1
log_msg $msg1
