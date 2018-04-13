defmodule EctoSandbox.Repo.Migrations.CreateTableChunks do
  use Ecto.Migration

  def change do
    create table(:chunks) do
      add(:data, :string)
    end
  end
end
