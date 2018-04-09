defmodule EctoSandbox.ServerSupervisor do
  use DynamicSupervisor

  def start_link() do
    DynamicSupervisor.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_) do
    DynamicSupervisor.init(strategy: :one_for_one)
  end

  def start_child(server) do
    spec = {Server, server: server}
    DynamicSupervisor.start_child(__MODULE__, spec)
  end

  def terminate(pid) do
    GenServer.stop(pid)
  end

  def start_server(name) do
    Swarm.register_name(name, __MODULE__, :start_child, [name])
  end

  def get(name) do
    Swarm.whereis_name(name)
  end
end