FROM rabbitmq:3-management

RUN rabbitmq-plugins --offline enable rabbitmq_peer_discovery_aws \
    && echo "management.load_definitions = /etc/rabbitmq/rabbitmq-definitions.json" >> /etc/rabbitmq/rabbitmq.conf \
    && echo "cluster_formation.peer_discovery_backend = rabbit_peer_discovery_aws" >> /etc/rabbitmq/rabbitmq.conf \
    && echo "cluster_formation.node_cleanup.only_log_warning = false" >> /etc/rabbitmq/rabbitmq.conf \
    && echo "cluster_formation.aws.use_autoscaling_group = true" >> /etc/rabbitmq/rabbitmq.conf

COPY docker-cluster-entrypoint.sh /usr/local/bin/
COPY rabbitmq-definitions.json /etc/rabbitmq/

ENTRYPOINT ["docker-cluster-entrypoint.sh"]
CMD ["rabbitmq-server"]
