#!/bin/bash

STATE_FILE='/tmp/deploy_complete'

echo "Waiting for state file $STATE_FILE to exist in dploy"

while [ ! -f $STATE_FILE ]
do
  sleep 1
done

echo "State file $STATE_FILE exists, Deployment is complete"
