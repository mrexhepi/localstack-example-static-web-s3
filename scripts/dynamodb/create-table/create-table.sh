#!/bin/bash


display_usage() {
	echo "Creates a dynamo db table"
	echo -e "\nUsage: $0 [json-full-path] [endpoint-url] \n"
}

if [  $# -ne 2 ]
then
  display_usage
  exit 1
fi

input_json=$1
endpoint_url=$2

aws --endpoint-url="$endpoint_url" dynamodb create-table --cli-input-json "file://$input_json"

echo "Table is created"

echo "Available tables are:"
aws --endpoint-url="$endpoint_url" dynamodb list-tables 