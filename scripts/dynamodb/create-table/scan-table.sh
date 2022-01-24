#!/bin/bash


display_usage() {
	echo "Scans a dynamo db table"
	echo -e "\nUsage: $0 [table-name] [endpoint-url] \n"
}

if [  $# -le 1 ]
then
  display_usage
  exit 1
fi

table_name=$1
endpoint_url=$2

aws --endpoint-url="$endpoint_url" dynamodb scan \
    --table-name "$table_name"


echo "Available tables are:"
aws --endpoint-url="$endpoint_url" dynamodb list-tables    