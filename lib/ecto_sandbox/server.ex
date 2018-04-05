defmodule Server do
  use GenServer
  alias EctoSandbox.User
  alias EctoSandbox.Repo

  def start_link() do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init([]) do
    {:ok, []} 
  end

  def store(name) do
    GenServer.cast(__MODULE__, name)
  end

  def handle_cast(name, state) do
    Repo.insert!(%User{name: name})
    {:noreply, state} 
  end
end
