#!/bin/bash
STATE_FILE='/tmp/deploy_complete'

if [ -z "$SC_ENV" ]; then
    echo "SC_ENV must be set to deploy"
    exit 1
fi

echo "Deploying amishscooters.com for $SC_ENV"

#echo "Press [CTRL+C] to stop.."
#while true
#do
#    sleep 1
#done

#This is extremely risky - a blank value will cause deletion of our entire bucket - there we exit if its empty
AWS_DEFAULT_REGION=$SC_AWS_REGION AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY aws s3 --region $SC_AWS_REGION rm s3://amishscooters.com/ --recursive
AWS_DEFAULT_REGION=$SC_AWS_REGION AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY aws s3 --region $SC_AWS_REGION cp /usr/src/static/amishscooters.com/ s3://amishscooters.com/ --recursive

echo "COMPLETE" > $STATE_FILE
