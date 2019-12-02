#!/bin/bash

BUCKET_NAME=$1
BEFORE=$2
AFTER=$3
PATHS=$(aws s3 ls $BUCKET_NAME --recursive\
	|grep $BEFORE\
	|awk '{print $4}')

if [ -z "$4" ]; then
  echo "Running in --dryrun mode. Use '--force' to force renames."
elif [ "$4" == '--force' ]; then
  echo "Forcing renames inside $BUCKET_NAME."
fi

for path in  $PATHS; do
  before="s3://$path"
  after=${before//$BEFORE/$AFTER}
  if [ -z "$4" ]; then
    echo "aws s3 cp $before $after --dryrun"
    aws s3 cp $before $after --dryrun
  elif [ "$4" == '--force' ]; then
    aws s3 cp $before $after
  fi
done

echo "Done"
