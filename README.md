# ecs-stale-ec2-rescaler

Docker Image for ECS to terminate a stale container instance that belongs to a autoscaling group.

# How this works

1. Polling the latest `/var/log/ecs/ecs-agent.log` until the error message is detected.
    - The message is `Error getting message from ws backend`.
1. Notify the detection to Slack if `SLACK_URL` is specified.
1. Execute `aws autoscaling terminate-instance-in-auto-scaling-group --instance-id $INSTANCE_ID --no-should-decrement-desired-capacity`

# Environment Variables

- `POLLING_MAX_ATTEMPTS`: Max number of attempts for polling. (default: `60`)
- `POLLING_INTERVAL`: Interval seconds for polling. (default: `1`)
- `INSTANCE_IDENTITY_URL`: The URL to get the instance identity. (default: `"http://169.254.169.254/latest/dynamic/instance-identity/document"`)
- `SLACK_URL`: Slack webhook url for the notification. (optional)
- `SLACK_ADDITIONAL_MESSAGE`: Slack addtional message for the notification. (optional)
- `SLACK_CHANNEL`: Slack channel for the notification. (optional)
- `SLACK_ICON_EMOJI`: Slack icon emoji for the notification. (optional)

# Issues that this repositry concerns

- [amazon-ecs-agent#1698 Docker corrupted](https://github.com/aws/amazon-ecs-agent/issues/1698)
- [amazon-ecs-agent#1667 One task prevents from all of the other in instance to change from PENDING to RUNNING](https://github.com/aws/amazon-ecs-agent/issues/1667)

# ChangeLog

[CHANGELOG.md](./CHANGELOG.md)

# License

[Apache License 2.0](./LICENSE.txt)

# Author

@civitaspo

