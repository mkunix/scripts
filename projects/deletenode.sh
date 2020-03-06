#!/bin/bash
#Delete Chef Node

NODE=$1
SHORTY=$(echo $NODE|awk -F"." '{print $1}')

knife node show ${NODE} --format json > /tmp/${SHORTY}.json > /dev/null
knife node delete ${NODE} -y > /dev/null
sleep 2
knife client delete ${NODE} -y /dev/null
sleep 2
knife node from file /tmp/${SHORTY}.json  >&1

read -p "Press 1 to reboot, 2 to run chef client, q to quit: " fix_input

if [[ ${fix_input} == "1" ]]
then
  echo "Reboot host commands: "
elif [[ ${fix_input} == "2" ]]
then
  echo "Kicking off the Chef-Client.."
  ssh -o StrictHostKeyChecking=no mkanthasamy@${NODE} "sudo mv /etc/chef/client.pem /etc/chef/client.pem.`date +"%H-%M"`"
  ssh -o StrictHostKeyChecking=no mkanthasamy@${NODE} "sudo chef-client"
elif [[ ${fix_input} == "q" ]]
then
  echo "Quitting..."
  exit
  #statements
fi
