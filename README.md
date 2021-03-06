# ecs-stale-ec2-rescaler

[![Tags](https://img.shields.io/github/tag/civitaspo/ecs-stale-ec2-rescaler.svg?style=flat-square)](https://github.com/civitaspo/ecs-stale-ec2-rescaler/tags)
[![Docker Pulls](https://img.shields.io/docker/pulls/civitaspo/ecs-stale-ec2-rescaler.svg?style=flat-square)](https://hub.docker.com/r/civitaspo/ecs-stale-ec2-rescaler)

Docker Image for ECS to terminate a stale container instance that belongs to a autoscaling group.

# How this works

1. Polling the latest `/var/log/ecs/ecs-agent.log` until the below error message is detected.
    - `Error getting message from ws backend`
    - `Error response from daemon: conflict: unable to delete`
    - `Duplicate ENI attachment message`
1. Notify the detection to Slack if `SLACK_URL` is specified.
1. Execute `aws autoscaling terminate-instance-in-auto-scaling-group --instance-id $INSTANCE_ID --no-should-decrement-desired-capacity`

# Environment Variables

- `POLLING_MAX_ATTEMPTS`: Max number of attempts for polling. (default: `60`)
- `POLLING_INTERVAL`: Interval seconds for polling. (default: `1`)
- `DUPLICATE_ENI_ATTACHMENT_PER_HOUR_THRESHOLD`: Threshold for number of 'Duplicate ENI attachment message' per hour. (default: `50`)
- `INSTANCE_IDENTITY_URL`: The URL to get the instance identity. (default: `"http://169.254.169.254/latest/dynamic/instance-identity/document"`)
- `SLACK_URL`: Slack webhook url for the notification. (optional)
- `SLACK_ADDITIONAL_MESSAGE`: Slack addtional message for the notification. (optional)
- `SLACK_CHANNEL`: Slack channel for the notification. (optional)
- `SLACK_ICON_EMOJI`: Slack icon emoji for the notification. (optional)

# Issues that this repositry concerns

- [amazon-ecs-agent#1698 Docker corrupted](https://github.com/aws/amazon-ecs-agent/issues/1698)
- [amazon-ecs-agent#1667 One task prevents from all of the other in instance to change from PENDING to RUNNING](https://github.com/aws/amazon-ecs-agent/issues/1667)
- [amazon-ecs-agent#1980 Cleanup is not working when ECS mamanged image is running in non-managed container](https://github.com/aws/amazon-ecs-agent/issues/1980)

# Example

- [Example Task](./example/ecs-task-cli-input.json)
- [Example Task Role](./example/ecs-task-role.json)
- [Example Service](./example/ecs-service-cli-input.json)

# ChangeLog

[CHANGELOG.md](./CHANGELOG.md)

# License

[Apache License 2.0](./LICENSE.txt)

# Author

@civitaspo

