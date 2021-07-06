# rundeck-aws-ssm
Rundeck Script Node Executor for AWS SSM

This is a Rundeck [Script Node Execution](https://docs.rundeck.com/docs/administration/projects/node-execution/script.html#script-node-execution) script that allows you to execute commands on remote nodes via the AWS SSM Run Command - specifically, the [RunShellScript](https://docs.aws.amazon.com/systems-manager/latest/userguide/walkthrough-cli.html#walkthrough-cli-example-1) command.

#### 1. Place ssm_wrapper.sh on your Rundeck server - such as `/tmp/ssm_wrapper.sh`

#### 2a. To set this as the Node Executor for nodes at the project level, set the following in your `project.properties` file:
    script-exec.default.command=/tmp/ssm_wrapper.sh ${node.instanceId} ${exec.command}
#### 2b. To set this as the Node Executor for individual nodes, add the following to the custom attributes of your node(s) definition:
    script-exec=/tmp/ssm_wrapper.sh ${node.instanceId} ${exec.command}
