#!/bin/bash
#Delete Chef Node
NODE=$1
SHORTY=$(echo $NODE|awk -F"." '{print $1}')

KNIFE_CMDS() {

NODE_FILE="/tmp/${SHORTY}.json"
NODE_SAVE="knife node show ${NODE} --format json"
$NODE_SAVE > ${NODE_FILE}
NODE_LINES=$(wc -l ${NODE_FILE})

[[ -f /tmp/${SHORTY}.json ]] && [[ ${NODE_LINES -gt 5} ]] && echo "Saved file verified to be non-empty file"

knife node delete ${NODE} -y
sleep 2
knife client delete ${NODE} -y
sleep 2
knife node from file /tmp/${SHORTY}.json
}

POST_KNIFE() {
#Post Knife tasks on Cliet
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
fi

}

USAGE() {
echo "USAGE: `basename $0` FQDN [File Name]"
echo "Example:"
echo "`basename $0` term00x-ops-23.portal.webmd.com"
echo "`basename $0` /tmp/hostslist"
}

#Main Program
if [[ $# -eq "0" ]]
then USAGE
fi

if [[ -f $1 ]]
then
  echo "TODO: work for file "
elif [[ $1 =~ ^[a-zA-Z].*.portal.webmd.com ]]
then KNIFE_CMDS
fi
