defmodule SakeApp.Repo.Migrations.CreateBreweries do
  use Ecto.Migration

  def change do
    create table(:breweries) do
      add :name, :string
      add :name_kanji, :string
      add :city, :string
      add :region, references(:regions)

      timestamps()
    end

  end
end
