defmodule SakeApp.Repo.Migrations.AddDescriptionToRice do
  use Ecto.Migration

  def change do
    alter table(:rice) do
      add :description, :string
    end
  end
end
