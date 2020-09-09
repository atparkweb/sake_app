defmodule SakeApp.Repo.Migrations.CreateRegions do
  use Ecto.Migration

  def change do
    create table(:regions) do
      add :name, :string
      add :name_kanji, :string

      timestamps()
    end

  end
end
