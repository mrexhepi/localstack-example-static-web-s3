#!/bin/bash

display_usage() {
	echo "Creates a s3 bucket with web access with LocalStack"
	echo -e "\nUsage: $0 [bucket-name] [endpoint-url] [folder-path] [start-index-file] \n"
}

if [  $# -le 2 ]
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
start_index_file=$4


aws s3 mb --endpoint-url="$endpoint_url" "s3://"$bucket_name""

aws s3api --endpoint-url="$endpoint_url"  put-public-access-block \
    --bucket="$bucket_name" \
    --public-access-block-configuration "BlockPublicAcls=false,IgnorePublicAcls=false,BlockPublicPolicy=false,RestrictPublicBuckets=false"

aws s3api --endpoint-url="$endpoint_url"  put-bucket-policy --bucket="$bucket_name" --policy "{
  \"Version\": \"2012-10-17\",
  \"Statement\": [
      {
          \"Sid\": \"PublicReadGetObject\",
          \"Effect\": \"Allow\",
          \"Principal\": \"*\",
          \"Action\": \"s3:GetObject\",
          \"Resource\": \"arn:aws:s3:::"$bucket_name"*\"
      }
  ]
}"

aws s3 --endpoint-url="$endpoint_url"  website "s3://"$bucket_name"" --index-document $start_index_file  --error-document $start_index_file

aws s3 --endpoint-url="$endpoint_url" sync $folder_path "s3://"$bucket_name"""/"
echo " ------------------------------------------------------- "
echo " ------------------------------------------------------- "
echo "You can now access your static site here: $endpoint_url/$bucket_name/$start_index_file"
echo " ------------------------------------------------------- "
echo " ------------------------------------------------------- "
echo "List available buckets"
aws s3 --endpoint-url="$endpoint_url" ls
echo "Done"