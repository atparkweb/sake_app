defmodule SakeApp.Repo.Migrations.AddTypeToProduct do
  use Ecto.Migration

  def change do
    alter table(:products) do
      add :type, references(:types, type: :uuid)
      add :junmai, :boolean, default: false
    end
  end
end
