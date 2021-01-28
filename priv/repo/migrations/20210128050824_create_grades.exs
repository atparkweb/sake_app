defmodule SakeApp.Repo.Migrations.CreateGrades do
  use Ecto.Migration

  def change do
    create table(:grades, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :min_polish, :float
      add :max_polish, :float
      add :description, :string

      timestamps()
    end

  end
end
