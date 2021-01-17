defmodule :"Elixir.SakeApp.Repo.Migrations.Add-product-flavor-profile" do
  use Ecto.Migration

  def change do
    alter table(:products) do
      add :flavor_profile, :string
    end
  end
end
