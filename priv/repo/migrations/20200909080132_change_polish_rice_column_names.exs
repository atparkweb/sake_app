defmodule SakeApp.Repo.Migrations.ChangePolishRiceColumnNames do
  use Ecto.Migration

  def change do
    rename table(:products), :polish, to: :product_polish
    rename table(:products), :rice, to: :product_rice
  end
end
