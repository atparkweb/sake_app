defmodule SakeApp.Sake.Product do
  use SakeApp.Schema
  import Ecto.Changeset
  
  alias SakeApp.Geography.Prefecture
  alias SakeApp.Sake.{Rice, Type, Designation, Brewery}

  schema "products" do
    field :abv,               :float
    field :smv,               :float
    field :brand,             :string
    field :brand_kanji,       :string
    field :name,              :string
    field :name_kanji,        :string
    field :acidity,           :float
    field :short_description, :string
    field :long_description,  :string
    field :tasting_notes,     :string
    

    belongs_to :rice, Rice, foreign_key: :product_rice
    belongs_to :designations, Designation, foreign_key: :designation
    belongs_to :types, Type, foreign_key: :type
    belongs_to :prefectures, Prefecture, foreign_key: :prefecture
    belongs_to :breweries, Brewery, foreign_key: :brewery

    timestamps()
  end

  @doc false
  def changeset(product, attrs \\ %{}) do
    product
    |> cast(attrs, [:brand, :brand_kanji, :name, :name_kanji, :abv, :acidity, :smv, :designation, :product_rice, :type, :prefecture, :brewery, :short_description, :long_description, :tasting_notes ])
    |> cast_assoc(:designations)
    |> cast_assoc(:rice)
    |> cast_assoc(:prefectures)
    |> cast_assoc(:breweries)
    |> validate_required([:brand, :name])
    |> unique_constraint([:name, :brand])
  end
end
