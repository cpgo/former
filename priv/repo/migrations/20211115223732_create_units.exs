defmodule Former.Repo.Migrations.CreateUnits do
  use Ecto.Migration

  def change do
    create table(:units) do
      add :description, :string

      timestamps()
    end
  end
end
