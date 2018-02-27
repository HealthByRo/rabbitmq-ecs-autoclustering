FROM rabbitmq:3-management

RUN rabbitmq-plugins --offline enable rabbitmq_peer_discovery_aws \
    && echo "cluster_formation.peer_discovery_backend = rabbit_peer_discovery_aws" >> /etc/rabbitmq/rabbitmq.conf \
    && echo "cluster_formation.aws.use_autoscaling_group = true" >> /etc/rabbitmq/rabbitmq.conf
