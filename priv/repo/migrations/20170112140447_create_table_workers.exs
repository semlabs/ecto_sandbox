defmodule EctoSandbox.Repo.Migrations.CreateTableWorkers do
  use Ecto.Migration

  def change do
    create table(:workers) do
      add(:description, :string)
    end
  end
end
