defmodule SakeApp.Sake.Product do
  use SakeApp.Schema
  import Ecto.Changeset

  schema "products" do
    field :abv,        :float
    field :smv,        :float
    field :name,       :string
    field :name_kanji, :string
    field :acidity,    :float
    

    belongs_to :rice, {"rice", Rice}, foreign_key: :product_rice
    belongs_to :designations, {"designation", Designation}, foreign_key: :designation
    belongs_to :types, {"type", Type}, foreign_key: :type
    belongs_to :prefectures, {"prefecture", Prefecture}, foreign_key: :prefecture
    belongs_to :breweries, {"brewery", Brewery}, foreign_key: :brewery

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :name_kanji, :abv, :acidity, :smv ])
    |> validate_required([:name, :name_kanji])
  end
end
