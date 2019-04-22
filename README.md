# KafkaPlayground

A Kafka sample project

In here I wanted to show how you can:

- Produce a message to a Kafka Broker
- Consume messages from Kafka Broker

I tried to paid attention to [ordering guarantee](https://medium.com/@felipedutratine/kafka-ordering-guarantees-99320db8f87f)

# Get Started

Start the Kafka cluster (only for development purpose)

```
docker-compose up
```

I used the [bitnami docker images](https://hub.docker.com/r/bitnami/kafka/)

## Test Kafka Setup

I tried to follow the [quickstart steps](https://kafka.apache.org/quickstart)

1) Enter Kafka

```
docker exec -it kafka_playground_kafka1_1 /bin/bash
```

2) Create a topic

```
/opt/bitnami/kafka/bin/kafka-topics.sh --create --topic test --zookeeper zookeeper:2181 --replication-factor 1 --partitions 1
```

3) Get the detail about the topic

```
/opt/bitnami/kafka/bin/kafka-topics.sh --describe --zookeeper zookeeper:2181 --topic test
```

4) Producing messages

I wanted to produce messages for a certain key, [so that we can guarantee the order for each kafka partion](https://medium.com/@felipedutratine/kafka-ordering-guarantees-99320db8f87f).

```
/opt/bitnami/kafka/bin/kafka-console-producer.sh --broker-list 127.0.0.1:9092 --topic test --property "parse.key=true" --property "key.separator=:"
```

example of a message:

```
mykey:a message
```

5) Consuming messages

```
/opt/bitnami/kafka/bin/kafka-console-consumer.sh --bootstrap-server 127.0.0.1:9092 --topic test --from-beginning --property "print.key=true"
```

# Now with Elixir

```
TBD
```