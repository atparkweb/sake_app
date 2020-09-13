defmodule SakeApp.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :name_kanji, :string
      add :abv, :float
      add :prefecture, references(:prefectures, type: :uuid)
      add :brewery, references(:breweries, type: :uuid)

      timestamps()
    end

  end
end
