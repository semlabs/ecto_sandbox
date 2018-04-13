defmodule EctoSandbox.Workers.Worker.Server do
  use GenServer
  alias EctoSandbox.Chunk
  alias EctoSandbox.Repo

  def init({worker, _}) do
    {:ok, worker}
  end

  def store(worker, data) do
    chunk = create(%{data: encode(data)})

    {worker, chunk}
  end

  def create(data) do
    inserted =
      %Chunk{}
      |> Chunk.changeset(data)
      |> Repo.insert()

    EctoSandbox.Notification.broadcast(:chunk_stored, "stored")

    inserted
  end

  defp encode(data), do: Poison.encode!(data)

  def handle_call({:process, data}, _pid, worker) do
    Process.sleep(50)
    {worker, chunks} = store(worker, data)

    {:reply, chunks, worker}
  end
end
