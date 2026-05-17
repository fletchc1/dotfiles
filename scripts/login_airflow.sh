#!/bin/bash
#
# login_airflow_ssh.sh
#
# Description:
#   Retrieves airflow task details using AWS SDK and starts ssh connection to ecs container task
#
# Usage:
#   ./login_redshift.sh <cluster-identifier> <aws-region>
#
# Arguments:
#   cluster-identifier   The identifier of the Airflow cluster.
#   task-name             The name of the airflow task to connect to
#
# Output:
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
TASK_ID=$(aws ecs list-tasks --cluster $1 --family $2 --query "taskArns[0]" | awk -F\/ '{print $NF}' | sed s'/"//g')
aws ecs execute-command --cluster $1 --task $TASK_ID --interactive --command "/bin/sh"
