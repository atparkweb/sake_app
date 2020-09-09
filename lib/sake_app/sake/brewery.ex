defmodule SakeApp.Sake.Brewery do
  use Ecto.Schema
  import Ecto.Changeset

  schema "breweries" do
    field :city, :string
    field :name, :string
    field :name_kanji, :string
    
    belongs_to :regions, {"region", Region}, foreign_key: :region

    timestamps()
  end

  @doc false
  def changeset(brewery, attrs) do
    brewery
    |> cast(attrs, [:name, :name_kanji, :city])
    |> validate_required([:name, :name_kanji, :city])
  end
end
