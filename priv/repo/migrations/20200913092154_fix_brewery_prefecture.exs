defmodule SakeApp.Repo.Migrations.FixBreweryPrefecture do
  use Ecto.Migration

  def change do
    alter table(:breweries) do
      remove :prefecure
      add :prefecture, references(:prefectures, type: :uuid)
    end
  end
end
