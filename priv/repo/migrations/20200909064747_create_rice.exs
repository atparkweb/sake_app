defmodule SakeApp.Repo.Migrations.CreateRice do
  use Ecto.Migration

  def change do
    create table(:rice, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :name_kanji, :string
      add :prefecture, references(:prefectures, type: :uuid)

      timestamps()
    end

  end
end
