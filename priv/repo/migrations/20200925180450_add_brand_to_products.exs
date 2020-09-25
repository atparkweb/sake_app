defmodule SakeApp.Repo.Migrations.AddBrandToProducts do
  use Ecto.Migration

  def change do
    alter table(:products) do
      add :brand,       :string, null: false
      add :brand_kanji, :string
    end
  end
end
