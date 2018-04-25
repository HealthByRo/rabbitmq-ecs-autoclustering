#!/bin/bash

[ -n "$AWS_USE_PRIVATE_IP" ] && echo "cluster_formation.aws.use_private_ip = $AWS_USE_PRIVATE_IP" >> /etc/rabbitmq/rabbitmq.conf
[ -n "$LOG_LEVEL" ] && echo "log.console.level = $LOG_LEVEL" >> /etc/rabbitmq/rabbitmq.conf

if [ -n "$AWS_INSTANCE_NAME" ]; then
    sed -i -e "/cluster_formation.aws.use_autoscaling_group = true/d" /etc/rabbitmq/rabbitmq.conf
    echo "cluster_formation.aws.instance_tags.Name = $AWS_INSTANCE_NAME" >> /etc/rabbitmq/rabbitmq.conf
fi

jq -n --arg vhost "$RABBITMQ_DEFAULT_VHOST" "$(cat /etc/rabbitmq/rabbitmq-definitions.json.template)" >/etc/rabbitmq/definitions.json

source /usr/local/bin/docker-entrypoint.sh
