#!/bin/bash

BUCKET_NAME=$1
INVALID=$2
VALID=$3
PATHS=$(aws s3 ls $BUCKET_NAME --recursive\
	|grep $INVALID\
	|awk '{print $4}')

if [ -z "$4" ]; then
  echo "Running in --dryrun mode. Use '--force' to force renames."
elif [ "$4" == '--force' ]; then
  echo "Forcing renames inside $BUCKET_NAME."
fi

for path in  $PATHS; do
  before="s3://$path"
  after=${before//$INVALID/$VALID}
  if [ -z "$4" ]; then
    aws s3 mv $before $after --dryrun
  elif [ "$4" == '--force' ]; then
    aws s3 mv $before $after
  fi
done

echo "Done"
