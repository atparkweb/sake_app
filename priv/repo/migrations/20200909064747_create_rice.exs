defmodule SakeApp.Repo.Migrations.CreateRice do
  use Ecto.Migration

  def change do
    create table(:rice) do
      add :name, :string
      add :name_kanji, :string
      add :prefecture, references(:prefectures)

      timestamps()
    end

  end
end
