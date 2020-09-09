defmodule SakeApp.Repo.Migrations.AddPolishRiceToProducts do
  use Ecto.Migration

  def change do
    alter table(:products) do
      add :polish, references(:polish)
      add :rice , references(:rice)
    end
  end
end
