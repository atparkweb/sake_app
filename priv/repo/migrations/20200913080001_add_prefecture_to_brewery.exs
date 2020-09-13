defmodule SakeApp.Repo.Migrations.AddPrefectureToBrewery do
  use Ecto.Migration

  def change do
    alter table(:breweries) do
      remove :region
      add :prefecure, references(:prefectures)
    end
  end
end
