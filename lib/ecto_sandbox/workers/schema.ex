defmodule EctoSandbox.Workers.Schema do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}

  schema "workers" do
    field(:description, :string)
  end

  @doc false
  def changeset(collector, attrs) do
    collector
    |> cast(attrs, [:description])
  end
end
