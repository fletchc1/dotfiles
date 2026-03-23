#!/bin/bash
#
# login_redshift.sh
#
# Description:
#   Retrieves Redshift cluster connection information using AWS CLI.
#
# Usage:
#   ./login_redshift.sh <cluster-identifier> <aws-region>
#
# Arguments:
#   cluster-identifier   The identifier of the Redshift cluster.
#   aws-region           The AWS region where the cluster is located.
#   db-user              The redshift username to retrieve temporary credentials for.
#
# Output:
#   Prints a JSON object containing the host, port, and dbname of the cluster.
#
# Requirements:
#   - AWS CLI must be installed and configured.
#   - jq must be installed (if you plan to parse the output).
#   - must have a means of generating AWS credentials that is called before this script, e.g. aws-vault
#
# Example:
#   ./login_redshift.sh my-cluster us-west-2
#
#
CLUSTER_INFO=$(aws redshift describe-clusters --cluster-identifier $1 --region $2 --query 'Clusters[0].{host: Endpoint.Address, port: Endpoint.Port, dbname: DBName}')
TEMP_CREDENTIALS=$(aws redshift get-cluster-credentials --cluster-identifier $1 --region $2 --db-user $3 --query '{username: DbUser, password: DbPassword}')

CONNECTION_DATA=$(jq --slurp 'add' <(echo $CLUSTER_INFO) <(echo $TEMP_CREDENTIALS))

export PGHOST=$(echo $CONNECTION_DATA | jq -r '.host')
export PGPORT=$(echo $CONNECTION_DATA | jq -r '.port')
export PGDATABASE=$(echo $CONNECTION_DATA | jq -r '.dbname')
export PGUSER=$(echo $CONNECTION_DATA | jq -r '.username')
export PGPASSWORD=$(echo $CONNECTION_DATA | jq -r '.password')
echo "$CONNECTION_DATA"
