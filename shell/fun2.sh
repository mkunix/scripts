#!/usr/bin/env bash
#Display non-existent file and print the exit code

function_1() {
  echo "Displaying the Non-Existent File..."
  ls -ld /etc/nofile
  }

function_1

echo "The exit code for this is script is:  "${?}" "
