defmodule SakeApp.Repo.Migrations.MakeNamesNonNull do
  use Ecto.Migration

  def change do
    alter table(:breweries) do
      modify :name, :string, null: false
    end
    
    alter table(:designations) do
      modify :name, :string, null: false
    end
    
    alter table(:prefectures) do
      modify :name, :string, null: false
    end
    
    alter table(:products) do
      modify :name, :string, null: false
    end
    
    alter table(:regions) do
      modify :name, :string, null: false
    end
    
    alter table(:rice) do
      modify :name, :string, null: false
    end
    
    alter table(:types) do
      modify :name, :string, null: false
    end
  end
end
