#!/bin/bash

FOLDER=false
while [[ $FOLDER == "false"  ]] ; do
  echo "not found"
  sleep 1
  find /tmp -name "Ora*" | grep -q Ora
  if [[ $? == "0" ]] ; then
    FOLDER=true
  else
    FOLDER=false
  fi
done

cd /tmp/Ora*
sleep 2
tail -f /tmp/Ora*/installActions* > /tmp/logs/installActions.log &
tail -f /tmp/Ora*/oraInstall*.err > /tmp/logs/oraInstall.err &
tail -f /tmp/Ora*/oraInstall*.out > /tmp/logs/oraInstall.out
