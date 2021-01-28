defmodule :"Elixir.SakeApp.Repo.Migrations.Drop-designations" do
  use Ecto.Migration

  def change do
    drop table("designations")
  end
end
