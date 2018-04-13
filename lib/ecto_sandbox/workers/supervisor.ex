defmodule EctoSandbox.Workers.Supervisor do
  use DynamicSupervisor
  alias EctoSandbox.Workers.Worker

  def start_link(_) do
    DynamicSupervisor.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_) do
    DynamicSupervisor.init(strategy: :one_for_one)
  end

  def start_child(worker) do
    spec = {Worker, worker: worker}
    DynamicSupervisor.start_child(__MODULE__, spec)
  end

  def terminate(pid) do
    GenServer.stop(pid)
  end
end
