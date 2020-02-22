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
  echo No. of processors\: $(grep -wc processor /proc/cpuinfo)
  echo $(grep -m1  "model name" /proc/cpuinfo)
}

system_info
