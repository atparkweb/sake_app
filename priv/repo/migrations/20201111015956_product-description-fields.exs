defmodule :"Elixir.SakeApp.Repo.Migrations.Product-description-fields" do
  use Ecto.Migration

  def change do
    alter table(:products) do
      add :short_description, :string
      add :long_description,  :string
      add :tasting_notes,     :string
    end
  end
end
