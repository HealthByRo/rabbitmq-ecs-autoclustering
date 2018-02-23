FROM rabbitmq:3-management

RUN apt-get update && apt-get install -y python python-pip python-requests

COPY docker-entrypoint.sh /usr/local/bin/

# add ASG-based rabbitmq auto clustering tool
COPY rabbitmq_asg_autocluster.py /opt/
RUN chmod 755 /opt/rabbitmq_asg_autocluster.py

ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 4369 5671 5672 25672 15671 15672
CMD ["rabbitmq-server"]
