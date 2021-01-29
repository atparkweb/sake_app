defmodule :"Elixir.SakeApp.Repo.Migrations.Change-grade-columns" do
  use Ecto.Migration

  def change do
    alter table(:grades) do
      remove :min_polish
      remove :max_polish
      add :min_polish_remain, :float
      add :max_polish_remain, :float
    end
    
    alter table(:products) do
      add :semai_buai, :float
    end
  end
end
