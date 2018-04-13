defmodule EctoSandbox.Workers do
  alias EctoSandbox.Workers.Schema
  alias EctoSandbox.Repo
  alias EctoSandbox.Workers.Worker

  @doc """
  Creates a worker.

  """
  @spec create(%{}) :: {:ok, %Schema{}} | {:error, %Ecto.Changeset{}}
  def create(%{} = attrs) do
    with {:ok, worker} <- create_worker(attrs) do
      Worker.new(worker)
    end
  end

  def create_worker(attrs \\ %{}) do
    %Schema{}
    |> Schema.changeset(attrs)
    |> Repo.insert()
  end
end
