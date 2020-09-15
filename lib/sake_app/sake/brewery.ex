defmodule SakeApp.Sake.Brewery do
  use SakeApp.Schema
  import Ecto.Changeset

  schema "breweries" do
    field :city, :string
    field :name, :string
    field :name_kanji, :string
    
    belongs_to :prefectures, SakeApp.Geography.Prefecture, foreign_key: :prefecture

    timestamps()
  end

  @doc false
  def changeset(brewery, attrs) do
    brewery
    |> cast(attrs, [:name, :name_kanji, :city, :prefecture])
    |> cast_assoc(:prefectures)
    |> validate_required([:name, :name_kanji])
    |> unique_constraint(:name)
  end
end
