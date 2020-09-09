defmodule SakeApp.Repo.Migrations.CreatePolish do
  use Ecto.Migration

  def change do
    create table(:polish) do
      add :name, :string
      add :amount, :float

      timestamps()
    end

  end
end
