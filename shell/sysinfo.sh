#!/usr/bin/env bash
#
#Define the function
system_info() {
  echo "####################################"
  echo -e " \t#####OS Informaton#####"
  echo "####################################"
  lsb_release -drc
  echo
  echo "#### Processor Informaton"
  echo $(grep -wc processor /proc/cpuinfo)
}

system_info
