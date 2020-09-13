defmodule SakeApp.Repo.Migrations.CreateTypes do
  use Ecto.Migration

  def change do
    create table(:types) do
      add :name, :string
      add :name_kanji, :string
      add :short_description, :string
      add :long_description, :string

      timestamps()
    end

  end
end
