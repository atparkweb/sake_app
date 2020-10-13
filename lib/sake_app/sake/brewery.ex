defmodule SakeApp.Sake.Brewery do
  use SakeApp.Schema
  import Ecto.Changeset

  schema "breweries" do
    field :name, :string
    field :name_kanji, :string
    field :description, :string
    field :address, :string
    field :site_url, :string
    
    belongs_to :prefectures, SakeApp.Geography.Prefecture, foreign_key: :prefecture

    timestamps()
  end

  @doc false
  def changeset(brewery, attrs) do
    brewery
    |> cast(attrs, [:name, :name_kanji, :prefecture, :description, :address, :site_url])
    |> cast_assoc(:prefectures)
    |> validate_required([:name, :name_kanji])
    |> unique_constraint(:name)
  end
end
