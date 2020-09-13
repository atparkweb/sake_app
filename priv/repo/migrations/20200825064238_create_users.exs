defmodule SakeApp.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :username, :string
      add :email, :string, null: false
      add :password_hash, :string, null: false
      add :birthdate, :date

      timestamps()
    end
    
    unique_index(:user, [:email])

  end
end
