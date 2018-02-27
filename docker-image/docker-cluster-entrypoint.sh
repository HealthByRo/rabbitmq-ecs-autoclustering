#!/bin/bash

[ -n "$AWS_REGION" ] && echo "cluster_formation.aws.region = $AWS_REGION" >> /etc/rabbitmq/rabbitmq.conf
[ -n "$AWS_ACCESS_KEY_ID" ] && echo "cluster_formation.aws.access_key_id = $AWS_ACCESS_KEY_ID" >> /etc/rabbitmq/rabbitmq.conf
[ -n "$AWS_SECRET_ACCESS_KEY" ] && echo "cluster_formation.aws.secret_key = $AWS_SECRET_ACCESS_KEY" >> /etc/rabbitmq/rabbitmq.conf
[ -n "$AWS_USE_PRIVATE_IP" ] && echo "cluster_formation.aws.use_private_ip = $AWS_USE_PRIVATE_IP" >> /etc/rabbitmq/rabbitmq.conf
[ -n "$LOG_LEVEL" ] && echo "log.console.level = $LOG_LEVEL" >> /etc/rabbitmq/rabbitmq.conf

if [ -n "$AWS_CLOUDFORMATION_STACK_NAME" ]; then
    sed -i -e "/cluster_formation.aws.use_autoscaling_group = true/d" /etc/rabbitmq/rabbitmq.conf
    echo "cluster_formation.aws.instance_tags.aws:cloudformation:stack-name = $AWS_CLOUDFORMATION_STACK_NAME" >> /etc/rabbitmq/rabbitmq.conf
fi

source /usr/local/bin/docker-entrypoint.sh
