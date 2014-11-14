#!/bin/bash
die() {
  echo >&2 "$@"
  exit 1
}
g_remoteUser=ljinadasa
g_strExecutionDir=`dirname $0`
g_strExecutionDir=`cd $g_strExecutionDir;pwd`
g_logFile=$g_strExecutionDir/install.log
g_domain="vmware.com"
g_sshCMD="ssh -o ConnectTimeout=10 -o BatchMode=yes -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no "
g_uploadKeyScript=$g_strExecutionDir/uploadKey.exp
g_serverList=$g_strExecutionDir/$1
g_passList=$g_strExecutionDir/$2
g_keyFile=$g_strExecutionDir/$3

# Set no of Simultaneious runs
g_psCount=10
#
[ "$#" -eq 3 ] || die "usage: install-cert.sh  <server-list-file> <password-file> <keyfile>"
OIFS=$IFS
IFS=$'\n'
set -f
g_passwords=( $(<$g_passList) )
set +f
IFS=$OFIS
while IFS=, read -r server ip
do
  if [[ -n $server ]]; then
    [[ "$server" =~ "$g_domain" ]] || g_server=$server"."$g_domain
  else
    if [[ -n $ip ]]; then
      g_server=$ip
    else
      echo "Bad Servername or IP " >> $g_logFile
      continue
    fi
  fi
  $g_sshCMD $g_remoteUser@$g_server ls > /dev/null 2>&1
  if [ $? -eq 0 ]; then
     echo "$g_server,SSH trust is Already inplace" >> $g_logFile
     continue 
  else 
     echo "$g_server,SSH trust is not Setup. Uploading the Keys" >> $g_logFile
  fi
    $g_uploadKeyScript $g_server $g_remoteUser $g_keyFile ${g_passwords[@]}
  if  [ $? -ne 0 ]; then
      echo "$g_server,SSH key Upload failed" >> $g_logFile    
  else 
  # Test the trust 
     $g_sshCMD $g_remoteUser@$g_server ls > /dev/null 2>&1
     if [ $? -eq 0 ]; then
        echo "$g_server,SSH trust is inplace after Key upload" >> $g_logFile
     else
        echo "$g_server,SSH trust is not Setup after the Key upload" >> $g_logFile
     fi
  fi
done < $g_serverList
