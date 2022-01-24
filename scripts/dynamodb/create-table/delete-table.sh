#!/bin/bash


display_usage() {
	echo "Delete a dynamo db table"
	echo -e "\nUsage: $0 [table-name] [endpoint-url] \n"
}

if [  $# -ne 2 ]
then
  display_usage
  exit 1
fi

table_name=$1
endpoint_url=$2


aws --endpoint-url="$endpoint_url" dynamodb delete-table  --table-name="$table_name"

echo "Table $table_name is deleted"

echo "Available tables are:"
aws --endpoint-url="$endpoint_url" dynamodb list-tables