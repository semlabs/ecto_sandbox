defmodule Server do
  use GenServer
  alias EctoSandbox.User
  alias EctoSandbox.Repo

  def start_link(server) do
    GenServer.start_link(__MODULE__, [], name: String.to_atom(server))
  end

  def init(server) do
    {:ok, [server]} 
  end

  def store(pid, name) do
    GenServer.cast(pid, name)
  end

  def handle_cast(name, state) do
    Repo.insert!(%User{name: name})
    {:noreply, state} 
  end

  def child_spec(server: server) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, [server]},
      restart: :transient
    }
  end

end
