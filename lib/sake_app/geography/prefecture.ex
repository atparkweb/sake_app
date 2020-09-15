defmodule SakeApp.Geography.Prefecture do
  use SakeApp.Schema
  import Ecto.Changeset

  schema "prefectures" do
    field :name, :string
    field :name_kanji, :string
    
    belongs_to :regions, SakeApp.Geography.Region, foreign_key: :region

    timestamps()
  end

  @doc false
  def changeset(prefecture, attrs) do
    prefecture
    |> cast(attrs, [:name, :name_kanji, :region])
    |> cast_assoc(:regions)
    |> validate_required([:name, :name_kanji])
    |> unique_constraint(:name)
    |> foreign_key_constraint(:region)
  end
end
