defmodule SakeApp.Repo.Migrations.CreateDesignations do
  use Ecto.Migration

  def change do
    create table(:designations, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :polish_ratio_remain, :float
      add :short_description, :string
      add :long_description, :string

      timestamps()
    end
    
    create unique_index(:designations, [:name])
    
    alter table(:products) do
      add :designation, references(:designations, type: :uuid)
      add :smv, :float
      remove :meter
      remove :junmai
      remove :product_polish
    end
    
    drop table(:polish)

  end
end
