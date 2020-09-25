defmodule SakeApp.Repo.Migrations.AddProductUniqueIndex do
  use Ecto.Migration

  def change do
    create unique_index(:products, [:name, :brand])
  end
end
