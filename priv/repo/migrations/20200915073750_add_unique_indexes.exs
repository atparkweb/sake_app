defmodule SakeApp.Repo.Migrations.AddUniqueIndexes do
  use Ecto.Migration

  def change do
    create unique_index(:breweries, [:name])
    create unique_index(:prefectures, [:name])
    create unique_index(:products, [:name])
    create unique_index(:regions, [:name])
    create unique_index(:rice, [:name])
    create unique_index(:types, [:name])
    create unique_index(:users, [:email])
  end
end
