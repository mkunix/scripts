#!/bin/bash
#Fix the chef client configuration
set -o
set -e
set -pipefail

#Print the syntax
USAGE() {
     echo
     echo "Usage: `basename $0` -h hostname.portal.webmd.com [-f PATH] "
     exit 1
}

CHECK_ARG() {

  if [ $# -eq 0 ]
  then
    echo "Not enough arugments"
    USAGE
    exit 1
  fi
}


NODE_NAME=$1
FILE_NAME=$2

FQDN_CHECK() {
domain='portal.webmd.com'
if [[ $NODE_NAME == *"$domain" ]]
then
   echo "The hostnames contain ${domain} "
else
   USAGE
fi
}

DELETE_CLIENT() {

  while getops 'nf:' OPTION; do

		case ${arg} in
				n)
						echo " Code for hostname deletion from \$1 value"
            ;;
				$FILE_NAME)
						echo " Code for hostnames in file, from \$2 value"
            ;;
				*)
						echo "Print the syntax"
            ;;
		esac
done
}

#CHECK_ARG
FQDN_CHECK
#DELETE_CLIENT $1 $2
