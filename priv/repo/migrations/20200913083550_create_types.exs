defmodule SakeApp.Repo.Migrations.CreateTypes do
  use Ecto.Migration

  def change do
    create table(:types, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :name_kanji, :string
      add :short_description, :string
      add :long_description, :string

      timestamps()
    end

  end
end
