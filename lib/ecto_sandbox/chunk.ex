defmodule EctoSandbox.Chunk do
  use Ecto.Schema
  import Ecto.Changeset
  alias Ecto.UUID

  @primary_key {:id, UUID, autogenerate: true}

  schema "chunks" do
    field(:data, :string)
  end

  @doc false
  def changeset(%__MODULE__{} = chunk, attrs) do
    chunk
    |> cast(attrs, [:data])
  end
end
