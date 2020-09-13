defmodule SakeApp.Repo.Migrations.CreatePolish do
  use Ecto.Migration

  def change do
    create table(:polish, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :amount, :float

      timestamps()
    end

  end
end
