defmodule EctoSandbox.Notification do
  alias Phoenix.PubSub

  @name :notification_system

  @doc """
  Get the notification identifier
  """
  def name() do
    @name
  end

  @doc """
  Subscribe the current process to the provided topic by atom or string.
  """
  def subscribe(topic) when is_binary(topic) do
    name()
    |> PubSub.subscribe(topic)
  end

  def subscribe(topic) when is_atom(topic) do
    topic
    |> to_string()
    |> subscribe()
  end

  @doc """
  Send a message to the provided topic.
  """
  def broadcast(topic, message) when is_atom(topic) do
    bin_topic = to_string(topic)

    name()
    |> PubSub.broadcast(bin_topic, {topic, message})
  end

  def broadcast(topic, message) when is_binary(topic) do
    name()
    |> PubSub.broadcast(topic, {topic, message})
  end

  @doc """
  Unsubscribe the current process from a previously subscribed topic.
  """
  def unsubscribe(topic) when is_binary(topic) do
    name()
    |> PubSub.unsubscribe(topic)
  end

  def unsubscribe(topic) when is_atom(topic) do
    topic
    |> to_string()
    |> unsubscribe()
  end
end
