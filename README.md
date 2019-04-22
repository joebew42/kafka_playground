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

I used the  [wurstmeister docker images](https://hub.docker.com/r/wurstmeister/kafka/)

## Test Kafka Setup

I tried to follow the [quickstart steps](https://kafka.apache.org/quickstart)

1) Enter Kafka

```
docker exec -it kafka_playground_kafka1_1 /bin/bash
```

2) Create a topic

```
/opt/kafka/bin/kafka-topics.sh --create --topic test --zookeeper zookeeper:2181 --replication-factor 1 --partitions 1
```

3) Get the detail about the topic

```
/opt/kafka/bin/kafka-topics.sh --describe --zookeeper zookeeper:2181 --topic test
```

4) Producing messages

I wanted to produce messages for a certain key, [so that we can guarantee the order for each kafka partion](https://medium.com/@felipedutratine/kafka-ordering-guarantees-99320db8f87f).

```
/opt/kafka/bin/kafka-console-producer.sh --broker-list 127.0.0.1:9092 --topic test --property "parse.key=true" --property "key.separator=:"
```

example of a message:

```
mykey:a message
```

5) Consuming messages

```
/opt/kafka/bin/kafka-console-consumer.sh --bootstrap-server 127.0.0.1:9092 --topic test --from-beginning --property "print.key=true"
```

# Now with Elixir

I am using [KafkaEx](https://hexdocs.pm/kafka_ex/readme.html) as Kafka Client.

```
mix deps.get
```

```
iex -S mix
```

1) Produce a message

```
iex> Kafka.produce("test", "my key", "something")
```

2) Consume messages

```
iex> Kafka.consume("test")
```

# Questions

- How the partition is choosen based on the `key` of the message?
- Why I need to speficy the `partition` when consuming message for a specific topic?
- Add some examples with `consumers_group` and `workers`
- Setup a Kafka cluster with three nodes