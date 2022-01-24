#!/bin/bash

display_usage() {
	echo "Delete a S3 bucket of LocalStack"
	echo -e "\nUsage: $0 [bucket-name] [endpoint-url] \n"
}

if [  $# -le 0 ]
then
  display_usage
  exit 1
fi

if [[ ( $# == "--help") ||  $# == "-h" ]]
then
  display_usage
  exit 0
fi

bucket_name=$1
endpoint_url=$2
folder_path=$3



aws s3 rb --endpoint-url="$endpoint_url" s3://"$bucket_name" --force

echo " ------------------------------------------------------- "
echo " ------------------------------------------------------- "
echo "List available buckets"
aws s3 --endpoint-url="$endpoint_url" ls