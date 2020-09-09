defmodule SakeApp.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :name, :string
      add :name_kanji, :string
      add :abv, :float
      add :prefecture, references(:prefectures)
      add :brewery, references(:breweries)

      timestamps()
    end

  end
end
