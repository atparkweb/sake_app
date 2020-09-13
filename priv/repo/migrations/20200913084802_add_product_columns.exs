defmodule SakeApp.Repo.Migrations.AddProductColumns do
  use Ecto.Migration

  def change do
    alter table(:products) do
      add :acidity, :float
      add :meter,   :float
    end
  end
end
