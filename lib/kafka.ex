defmodule Kafka do
  def produce(topic, key, message) do
    request =
      %KafkaEx.Protocol.Produce.Request{
        topic: topic,
        messages: [
          %KafkaEx.Protocol.Produce.Message{
            key: key,
            value: message
          }
        ],
        compression: :none,
        partition: 0,
        required_acks: 1,
        timeout: 0
      }

    KafkaEx.produce(request)
  end

  def consume(topic, offset \\ 0) do
    KafkaEx.stream(topic, 0, offset: offset, no_wait_at_logend: true)
    |> Enum.map(fn(message) ->
      {message.offset, message.key, message.value}
    end)
  end
end
