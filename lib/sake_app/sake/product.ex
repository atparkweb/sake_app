defmodule SakeApp.Sake.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :abv, :float
    field :name, :string
    field :name_kanji, :string
    

    belongs_to :rice, {"rice", Rice}, foreign_key: :product_rice
    belongs_to :polish, {"polish", Polish}, foreign_key: :product_polish
    belongs_to :prefectures, {"prefecture", Prefecture}, foreign_key: :prefecture
    belongs_to :breweres, {"brewery", Brewery}, foreign_key: :brewery

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :name_kanji, :abv])
    |> validate_required([:name, :name_kanji, :abv ])
  end
end
