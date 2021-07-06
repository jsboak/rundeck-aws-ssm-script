#!/bin/bash

instanceId="$1"

cmdId=$(aws ssm send-command --instance-ids "$instanceId" --document-name "AWS-RunShellScript" --query "Command.CommandId" --output text --parameters commands="'${@:2}'")
[ $? -ne 0 ] && { echo "Usage: $0 instance_id command"; exit 1; }

while [ "$(aws ssm list-command-invocations --command-id "$cmdId" --query "CommandInvocations[].Status" --output text)" == "InProgress" ]; do sleep 1; done

aws ssm list-command-invocations --command-id "$cmdId" --details --query "CommandInvocations[*].CommandPlugins[*].Output[]" --output text
