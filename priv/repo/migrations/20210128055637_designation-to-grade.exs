defmodule :"Elixir.SakeApp.Repo.Migrations.Designation-to-grade" do
  use Ecto.Migration

  def change do
    alter table(:products) do
      add :genshu, :boolean
      add :junmai, :boolean
      add :grade, references(:grades, type: :uuid)
      remove :designation
    end
  end
end
