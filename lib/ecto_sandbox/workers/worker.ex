defmodule EctoSandbox.Workers.Worker do
  alias EctoSandbox.Workers.Supervisor
  alias EctoSandbox.Workers.Worker.Server

  @doc false
  def start_link(worker) do
    GenServer.start_link(Server, {worker, nil}, name: {:via, Registry, {Reg, worker.id}})
  end

  @doc """
  Create a new worker with a worker and watchdog
  """
  def new(worker) do
    Supervisor.start_child(worker)
    {:ok, worker}
  end

  @doc """
  Pass data to worker and process it
  """
  def work(worker_id, data) do
    GenServer.call({:via, Registry, {Reg, worker_id}}, {:process, data})
  end

  def child_spec(worker: worker) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, [worker]},
      restart: :transient
    }
  end
end
