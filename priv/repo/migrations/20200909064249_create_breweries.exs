defmodule SakeApp.Repo.Migrations.CreateBreweries do
  use Ecto.Migration

  def change do
    create table(:breweries, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :name_kanji, :string
      add :city, :string
      add :region, references(:regions, type: :uuid)

      timestamps()
    end

  end
end
