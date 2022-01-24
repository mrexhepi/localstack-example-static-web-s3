

display_usage() {
	echo "List all dynamodb tables"
	echo -e "\nUsage: $0 [endpoint-url]\n"
}

if [  $# -le 0 ]
then
  display_usage
  exit 1
fi
endpoint_url=$1

echo "Available tables are: "
aws --endpoint-url="$endpoint_url" dynamodb list-tables    