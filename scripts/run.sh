#!/bin/sh

# wait for rabbitmq server to start

INIT_FLAG="/var/lib/rabbitmq/.initialized"

if [ ! -f "$INIT_FLAG" ]; then
  echo "RabbitMQ not initialized. It will be initialized after start-up complete."

  /scripts/init.sh  && \
  touch $INIT_FLAG & \
  

  rabbitmq-server
else
  echo "RabbitMQ already initialized. It will not be initialized again."  
  rabbitmq-server
fi
