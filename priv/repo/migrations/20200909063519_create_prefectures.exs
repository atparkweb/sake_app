defmodule SakeApp.Repo.Migrations.CreatePrefectures do
  use Ecto.Migration

  def change do
    create table(:prefectures) do
      add :name, :string
      add :name_kanji, :string
      add :region, references(:regions)

      timestamps()
    end

  end
end
