defmodule KafkaPlaygroundTest do
  use ExUnit.Case
  doctest KafkaPlayground

  test "greets the world" do
    assert KafkaPlayground.hello() == :world
  end
end
