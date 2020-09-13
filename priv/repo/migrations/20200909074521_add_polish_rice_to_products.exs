defmodule SakeApp.Repo.Migrations.AddPolishRiceToProducts do
  use Ecto.Migration

  def change do
    alter table(:products) do
      add :polish, references(:polish, type: :uuid)
      add :rice , references(:rice, type: :uuid)
    end
  end
end
