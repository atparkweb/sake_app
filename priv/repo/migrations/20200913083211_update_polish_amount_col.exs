defmodule SakeApp.Repo.Migrations.UpdatePolishAmountCol do
  use Ecto.Migration

  def change do
    alter table(:polish) do
      remove :amount
      add :max_amount, :float
    end
  end
end
