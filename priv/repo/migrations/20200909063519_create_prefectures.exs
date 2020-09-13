defmodule SakeApp.Repo.Migrations.CreatePrefectures do
  use Ecto.Migration

  def change do
    create table(:prefectures, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :name_kanji, :string
      add :region, references(:regions, type: :uuid)

      timestamps()
    end

  end
end
