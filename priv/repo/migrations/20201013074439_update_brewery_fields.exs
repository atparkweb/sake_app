defmodule SakeApp.Repo.Migrations.UpdateBreweryFields do
  use Ecto.Migration

  def change do
    alter table(:breweries) do
      remove :city
      add :description, :string
      add :address,     :string
      add :site_url,    :string
    end
  end
end
