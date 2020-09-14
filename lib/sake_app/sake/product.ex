defmodule SakeApp.Sake.Product do
  use Ecto.Schema
  import Ecto.Changeset

  @timestamps_opts [type: :utc_datetime_usec]
  @primary_key {:id, :binary_id, autogenerate: true}

  schema "products" do
    field :abv,        :float
    field :smv,        :float
    field :name,       :string
    field :name_kanji, :string
    field :acidity,    :float
    

    belongs_to :rice, {"rice", Rice}, foreign_key: :product_rice
    has_one :designations, {"designation", Designation}, foreign_key: :designation
    has_one :types, {"type", Type}, foreign_key: :type
    belongs_to :prefectures, {"prefecture", Prefecture}, foreign_key: :prefecture
    belongs_to :breweries, {"brewery", Brewery}, foreign_key: :brewery

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :name_kanji, :abv, :acidity, :smv, :product_rice, :designation, :type, :prefecture, :brewery])
    |> validate_required([:name, :name_kanji])
  end
end
