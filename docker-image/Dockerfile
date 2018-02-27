FROM rabbitmq:3-management

RUN rabbitmq-plugins --offline enable rabbitmq_peer_discovery_aws \
    && echo "cluster_formation.peer_discovery_backend = rabbit_peer_discovery_aws" >> /etc/rabbitmq/rabbitmq.conf \
    && echo "cluster_formation.node_cleanup.only_log_warning = false" >> /etc/rabbitmq/rabbitmq.conf \
    && echo "cluster_formation.aws.use_autoscaling_group = true" >> /etc/rabbitmq/rabbitmq.conf

COPY docker-cluster-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker-cluster-entrypoint.sh"]
