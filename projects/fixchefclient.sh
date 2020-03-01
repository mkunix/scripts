#!/bin/bash
#Fix the chef client configuration

#functon to check for FQDN
#set -x
FQDN_CHECK() {
#echo "Just print the whatever server name:  "${1}""
domain='portal.webmd.com'
if [[ $1 == *"$domain" ]]
then
   echo "The hostnames contain ${domain} "
else
   echo
   echo 'The hostname has no portal.webmd.com'
   echo "Usage: $0 hostname.portal.webmd.com"
fi

}

DELETE_CLIENT() {
echo 

}
FQDN_CHECK $1
